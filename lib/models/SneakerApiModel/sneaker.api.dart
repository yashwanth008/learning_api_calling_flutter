import 'dart:convert';
import 'package:api_call_testing/models/SneakerApiModel/sneaker.dart';
import 'package:http/http.dart' as http;

class sneakerApi{
  // var req = unirest("GET", "https://v1-sneakers.p.rapidapi.com/v1/sneakers");
  //
  // req.query({
  // "limit": "25"
  // });
  //
  // req.headers({
  // "x-rapidapi-host": "v1-sneakers.p.rapidapi.com",
  // "x-rapidapi-key": "4f5510a3e7msh312b35961c2ab0ep15f260jsn402663ba4338",
  // "useQueryString": true
  // });

  static Future<List<sneaker>> getSneaker()async {
    var uri = Uri.https('v1-sneakers.p.rapidapi.com', 'v1/sneakers',
        {"limit": "25"});
    final response = await http.get(uri,
    headers: {
      "x-rapidapi-host": "v1-sneakers.p.rapidapi.com",
      "x-rapidapi-key": "4f5510a3e7msh312b35961c2ab0ep15f260jsn402663ba4338",
      "useQueryString": "true"
    });


    Map data = jsonDecode(response.body);
    List _temp = [];
    for(var i in data['results']){
      _temp.add(i);
    }
    return sneaker.sneakersFromSnapshot(_temp);
}
}