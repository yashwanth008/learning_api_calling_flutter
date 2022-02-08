class crypto {

  final String name;
  final String price;
  final String change;
  final String iconUrl;

  crypto({
    required this.name,
    required this.price,
    required this.change,
    required this.iconUrl,
  });

  factory crypto.fromJson(dynamic json){
    return crypto(
      name: json['name'] as String,
      price: json['price'] as String,
      change: json['change'] as String,
      iconUrl: json['iconUrl'] as String,
    );
  }

  static List<crypto> cryptoFromSnapshot(List snapshot){
    return snapshot.map((data){
      return crypto.fromJson(data);
    } ).toList();
  }
  @override
  String toString(){
    return' crypto(name:$name, price:$price, change:$change, iconUrl:$iconUrl)';
  }
}


