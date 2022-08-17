import 'package:barbotzapp/models/cocktail.dart';

List<Cocktail> Cocktails = [
  Cocktail(
    cocktailName: 'Sex on the Beach',
    ingredients: [
      {
        'name': 'Vodka',
        'amount': 40,
      },
      {
        'name': 'Cranberry',
        'amount': 100,
      },
      {
        'name': 'Orangejuice ',
        'amount': 100,
      },
      {
        'name': 'Whiskey ',
        'amount': 100,
      },
    ],
  ),
  Cocktail(
    cocktailName: 'Screw Driver',
    imageUrl: 'assets/screw_driver.png',
    ingredients: [
      {
        'name': 'Vodka',
        'amount': 40,
      },
      {
        'name': 'Orangejuice',
        'amount': 100,
      },
      {
        'name': 'Cranberry ',
        'amount': 100,
      },
      {
        'name': 'Rum ',
        'amount': 100,
      },
    ],
  )
];
