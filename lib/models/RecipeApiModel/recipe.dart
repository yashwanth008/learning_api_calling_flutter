class recipe{
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  recipe({required this.name,required this.images,required this.rating,required this.totalTime});

  factory recipe.fromJson(dynamic json){
    return recipe(
        name: json['name'] as String,
        images: json['images'][0]['hostedLargeUrl'] as String,
        rating: json['rating'] as double,
        totalTime: json['totalTime'] as String,
    );
  }

  static List<recipe> recipesFromSnapshot(List snapshot){
    return snapshot.map(
        (data){
          return recipe.fromJson(data);
        }
    ).toList();
  }
  @override
  String toString(){
    return 'recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}