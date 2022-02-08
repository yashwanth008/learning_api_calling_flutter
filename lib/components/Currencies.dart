import 'package:flutter/material.dart';

class Currencies extends StatelessWidget{
  final String name;
  final String price;
  final String change;
  final String iconUrl;
  Currencies({
    required this.name,
    required this.price,
    required this.change,
    required this.iconUrl,
});

  @override
  Widget build(BuildContext context) {
      return Container(

        width:MediaQuery.of(context).size.width,
        height: 120,
        child:Card(
          color: Colors.blueGrey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:[
                  SizedBox(width:37,),
                  Text(name,
                  textAlign:TextAlign.justify,
                  style: TextStyle(fontSize:15,color:Colors.white54),),
                ]
              ),
              ListTile(
                leading:CircleAvatar(
                  radius: 35.0,
                  backgroundImage:NetworkImage(iconUrl),
                ),

                title: Text(
                  price,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 18,color: Colors.white70),
                ),
                subtitle: Text(
                  change,
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 12,color: Colors.white60),
                ),

              ),
            ],
          ),
        )
      );
  }}