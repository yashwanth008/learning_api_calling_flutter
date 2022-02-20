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
        height: 140,
        child:Card(
          color: Colors.blueGrey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children:[
              SizedBox(height: 8,),
              Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children:[
                  SizedBox(width:37,),
                  Text(name,
                  // textAlign:TextAlign.justify,
                  style: TextStyle(fontSize:15,color:Colors.white54),),
                ]
              ),
              ListTile(
                leading:CircleAvatar(
                  radius: 35.0,
                  backgroundImage:NetworkImage(iconUrl),
                ),
                subtitle: _getSubtitletext(price, change),
                isThreeLine: true,

                // title: Text(
                //   price,
                //   textAlign: TextAlign.end,
                //   style: TextStyle(fontSize: 18,color: Colors.white70),
                // ),
                // subtitle: Text(
                //   change,
                //   textAlign: TextAlign.end,
                //   style: TextStyle(fontSize: 12,color: Colors.white60),
                // ),

              ),
            ],
          ),
        )
      );
  }
  Widget _getSubtitletext(String PriceUSD,String percentagechg){
    TextSpan priceTextWidget = new TextSpan(
      text: "\$ $price\n",style: TextStyle(color: Colors.orange) );
    String percentageChgText = "$change";
    TextSpan percentageChgTextWidget;
    if(double.parse(percentagechg)>0){
      percentageChgTextWidget = new TextSpan(
        text: percentageChgText,
        style: TextStyle(color: Colors.green)
      );
    }else{
      percentageChgTextWidget = new TextSpan(
          text: percentageChgText,
          style: TextStyle(color: Colors.red)
      );
    }
    return new RichText(
        text:new TextSpan(
          children: [priceTextWidget,percentageChgTextWidget]
        ) );
  }
}