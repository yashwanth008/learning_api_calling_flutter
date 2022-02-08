import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage2 extends StatelessWidget {
  fetchMovies() async{
    var Url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=bc563f8552872f8a78af416d16c71030&language=en-US&page=1';
    var response = await http.get(Uri.parse(Url));
    return json.decode(response.body)['results'];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
       title: Text(
           'MOVIES',
         style: TextStyle( fontSize: 25,color: Colors.pinkAccent),
       ),
        elevation: 2.0,
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: fetchMovies(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('error'),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Container(
                        height: 250,
                        alignment: Alignment.centerLeft,
                        child: Card(
                          child: Image.network(
                              "https://image.tmdb.org/t/p/w500" +
                                  snapshot.data[index]['poster_path']),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                snapshot.data[index]["original_title"],
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data[index]["release_date"],
                                style: TextStyle(color: Color(0xff868597)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                               Container(
                                  height: 120,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Text(
                                      snapshot.data[index]["overview"],
                                      style: TextStyle(color:Colors.red,fontSize: 16),
                                    ),
                                  ),
                                ),

                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
