import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:barbotzapp/models/cocktail.dart';

class CreateNewCocktail extends StatelessWidget {
  const CreateNewCocktail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            'name': 'Orangejuice',
            'amount': 100,
          },
          {
            'name': 'Whiskey',
            'amount': 100,
          },
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            ElevatedButton(
                child: Text('Add Cocktail'),
                onPressed: () {
                  CreateAndAddNewCocktail('Malibu Sunrise');
                }),
            const SizedBox(height: 50),
            ElevatedButton(
                child: Text('Get Cocktails'),
                onPressed: () {
                  getData();
                }),
          ],
        ),
      ),
    );
  }
}

Future CreateAndAddNewCocktail(String cocktailName) async {
  await FirebaseFirestore.instance.collection('all cocktails').add({
    'cocktailName': cocktailName,
    'ingredients': [
      {
        'name': 'Vodka',
        'amount': 100,
      }
    ]
  });
}

final _fireStore = FirebaseFirestore.instance;
Future<void> getData() async {
  // Get docs from collection reference
  QuerySnapshot querySnapshot =
      await _fireStore.collection('all cocktails').get();
  ;

  // Get data from docs and convert map to List
  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  //for a specific field
  // final allData =
  //     querySnapshot.docs.map((doc) => doc.get('fieldName')).toList();

  print(allData);
}
