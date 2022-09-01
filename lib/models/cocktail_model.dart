class CocktailMod {
  final String cocktailName;
  final String imageUrl;
  final List ingredients; // final List<Ingredient> ingredients

  String get name {
    return cocktailName;
  }

  CocktailMod(
      {required this.cocktailName,
      required this.imageUrl,
      required this.ingredients});

  CocktailMod.fromSnapshot(snapshot)
      : cocktailName = snapshot.data()['cocktailName'],
        imageUrl = snapshot.data()['imageUrl'],
        ingredients = snapshot.data()['ingredients'];

  factory CocktailMod.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['ingredients'] as List;
    print(list.runtimeType);
    List<Ingredient> ingredientsList =
        list.map((i) => Ingredient.fromJson(i)).toList();

    return CocktailMod(
        cocktailName: parsedJson['cocktailName'],
        imageUrl: parsedJson['imageUrl'],
        ingredients: ingredientsList);
  }
}

class Ingredient {
  final String name;
  final int amount;

  Ingredient({required this.name, required this.amount});

  factory Ingredient.fromJson(Map<String, dynamic> parsedJson) {
    return Ingredient(name: parsedJson['name'], amount: parsedJson['amount']);
  }
}
