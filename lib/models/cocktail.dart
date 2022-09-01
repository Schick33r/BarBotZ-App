class Cocktail {
  late String cocktailName;
  late String imageUrl;
  late List<Map> ingredients;

  String get name {
    return cocktailName;
  }

  List<Map> get ings {
    return ingredients;
  }

  Cocktail(
      {required this.cocktailName,
      this.imageUrl = 'assets/sex_on_the_beach.png',
      required this.ingredients});

  Cocktail.fromJson(Map<String, dynamic> json) {
    cocktailName = json['cocktailName'];
    imageUrl = json['imageUrl'];
    ingredients = json['ingredients'];
  }

  Map<String, dynamic> toMap() {
    return {
      'cocktailName': cocktailName,
      'imageUrl': imageUrl,
      'ingredients': ingredients
    };
  }
}
