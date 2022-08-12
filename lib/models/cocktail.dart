class Cocktail {
  String cocktailName;
  String imageUrl;
  List<Map> ingredients;

  Cocktail(
      {required this.cocktailName,
      this.imageUrl = 'assets/sex_on_the_beach.png',
      required this.ingredients});
}
