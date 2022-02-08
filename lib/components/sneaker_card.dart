import 'package:flutter/material.dart';

class SneakerCard extends StatelessWidget {
  final String brand;
  final String gender;
  final String title;
  // final String imageUrl;
  SneakerCard({
    required this.brand,
    required this.gender,
    required this.title,
    // required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        // image: DecorationImage(
        //   colorFilter: ColorFilter.mode(
        //     Colors.black.withOpacity(0.35),
        //     BlendMode.multiply,
        //   ),
        //   image: NetworkImage(imageUrl),
        //   fit: BoxFit.cover,
        // ),
      ),
      child: Card(
        child: Column(

          children: <Widget>[
             ListTile(

              title: Text(brand,
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              subtitle: Text(title,
              style: TextStyle(fontSize: 18),),

            ),
            Row(
              children: <Widget>[
                SizedBox(height: 25,),
                TextButton(
                  child: Text(gender,
                    style: TextStyle(fontSize: 18),),
                  onPressed: () {/* ... */},
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}