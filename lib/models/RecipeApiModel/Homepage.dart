import 'package:api_call_testing/models/RecipeApiModel/recipe.api.dart';
import 'package:api_call_testing/models/RecipeApiModel/recipe.dart';
import 'package:flutter/material.dart';

import '../../components/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<recipe> _recipes;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipe();
  }

  Future<void> getRecipe()async {
    _recipes = await recipeApi.getRecipe();
    setState(() {
      isLoading = false;
    });

  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Food recipe"
      //   ),
      // ),
      // body: isLoading?
      //     Center(child:CircularProgressIndicator(),)
      //     :ListView.builder(
      //   itemCount: _recipes.length,
      //     itemBuilder: (BuildContext context ,index){
      //     return RecipeCard(
      //         title: _recipes[index].name,
      //         cookTime:_recipes[index].totalTime,
      //         rating: _recipes[index].rating.toString(),
      //         thumbnailUrl: _recipes[index].images,
      //     );
      //     })
    );
  }
}
