import 'package:api_call_testing/models/CryptoApiModel/HomePage3.dart';
import 'package:api_call_testing/models/MoviesApiModel/HomePage2.dart';
import 'package:api_call_testing/models/RecipeApiModel/Homepage.dart';
import 'package:api_call_testing/models/SneakerApiModel/HomePage1.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Recipe APi",
      debugShowCheckedModeBanner: false,
      home: HomePage3(),
    );

  }
}
