import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_call_testing/models/CryptoApiModel/crypto.dart';
// var req = unirest("GET", "https://coinranking1.p.rapidapi.com/coins");
//
// req.query({
// "referenceCurrencyUuid": "yhjMzLPhuIDl",
// "timePeriod": "24h",
// "tiers": "1",
// "orderBy": "marketCap",
// "orderDirection": "desc",
// "limit": "50",
// "offset": "0"
// });
//
// req.headers({
// "x-rapidapi-host": "coinranking1.p.rapidapi.com",
// "x-rapidapi-key": "b8985371fcmsh3657388b5176c87p18dfc0jsn161803ebd149",
// "useQueryString": true
// });

class cryptoApi{
  static Future<List<crypto>> getCrypto() async{
        var uri = Uri.https("coinranking1.p.rapidapi.com","coins",
        {
          "referenceCurrencyUuid": "yhjMzLPhuIDl",
          "timePeriod": "24h",
          "tiers": "1",
          "orderBy": "marketCap",
          "orderDirection": "desc",
          "limit": "50",
          "offset": "0"
        }
        );

    final response = await http.get(uri,headers:
        {
          "x-rapidapi-host": "coinranking1.p.rapidapi.com",
          "x-rapidapi-key": "b8985371fcmsh3657388b5176c87p18dfc0jsn161803ebd149",
          "useQueryString": "true"
        }
    );


    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data['data']['coins']) {
      _temp.add(i);
    }


    return crypto.cryptoFromSnapshot(_temp);
  }
}