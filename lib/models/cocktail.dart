class Cocktail {
  String cocktailName;
  String imageUrl;
  List<Map> ingredients;

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
}
