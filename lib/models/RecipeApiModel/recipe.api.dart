import 'dart:convert';
import 'package:api_call_testing/models/RecipeApiModel/recipe.dart';
import 'package:http/http.dart' as http;



class recipeApi{

  static Future<List<recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri,headers:
  {
  "x-rapidapi-host": "yummly2.p.rapidapi.com",
  "x-rapidapi-key": "4f5510a3e7msh312b35961c2ab0ep15f260jsn402663ba4338",
  "useQueryString": "true"
  });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return recipe.recipesFromSnapshot(_temp);
}

}

