import 'package:api_call_testing/components/sneaker_card.dart';
import'package:api_call_testing/models/SneakerApiModel/sneaker.api.dart';
import 'package:api_call_testing/models/SneakerApiModel/sneaker.dart';
import 'package:flutter/material.dart';

class HomePage1 extends StatefulWidget {

  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  late List<sneaker> _sneakers;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    getSneaker();
  }
  Future<void> getSneaker()async {
    _sneakers = await sneakerApi.getSneaker();
    setState(() {
      isLoading = false;
    });
      print(_sneakers);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          'Snakers Api testing'
        ),
      ),
      body: isLoading?
      Center(child: CircularProgressIndicator(),):ListView.builder(
          itemCount: _sneakers.length,
          itemBuilder: (BuildContext contex,index){
            return SneakerCard(
                brand: _sneakers[index].brand,
                gender: _sneakers[index].gender,
                title: _sneakers[index].title,
                // imageUrl: _sneakers[index].imageUrl,
            );
          })
    );
  }
}
