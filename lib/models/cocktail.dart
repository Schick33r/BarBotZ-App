class Cocktail {
  String cocktailName;
  String imageUrl;
  String ingredient1;
  String ingredient2;
  String ingredient3;
  String ingredient4;

  Cocktail(
      {required this.cocktailName,
      this.imageUrl = 'assets/sex_on_the_beach.png',
      required this.ingredient1,
      required this.ingredient2,
      required this.ingredient3,
      required this.ingredient4});
}
