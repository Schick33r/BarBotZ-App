import 'dart:ui';
import 'package:barbotzapp/example/cocktails.dart';
import 'package:barbotzapp/models/cocktail.dart';
import 'package:barbotzapp/models/cocktail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_search/flutter_dropdown_search.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChangeBottles extends StatefulWidget {
  final List<Cocktail> cocktails;
  const ChangeBottles({Key? key, required this.cocktails}) : super(key: key);

  @override
  State<ChangeBottles> createState() => _ChangeBottlesState();
}

class _ChangeBottlesState extends State<ChangeBottles> {
  List<String> currentIngredients = [];
  List<CocktailMod> CocktailDatabaseList = [];
  List<String> ingredients = [
    "Vodka",
    "Peachliqeur",
    "Orangejuice",
    "Cranberryjuice"
  ];

  List<TextEditingController>? _controllers = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    getPositions(_controllers);
  }

  @override
  void dispose() {
    for (TextEditingController c in _controllers!) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[500],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.brown[700],
        title: const Text("Change your Bottles"),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                  onPressed: () {
                    updatePositions(_controllers);
                    getIngredientsFromPositons(currentIngredients);
                    deleteDocsFromCollection();
                    getCocktailsFromCocktailsDatabase();
                    checkAndAddAvailableCocktails(CocktailDatabaseList);
                    //setPositions(_controllers);
                    //printControllers();
                    //setAvailableCocktails(widget.cocktails);
                  },
                  icon: Icon(
                    Icons.save,
                  )))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            _controllers!.add(new TextEditingController());

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Position ' + [index + 1].toString() + ':'),
                  FlutterDropdownSearch(
                    textController: _controllers?[index],
                    items: ingredients,
                    dropdownHeight: (ingredients.length * 40),
                  ),
                  SizedBox(height: 12)
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Send Positions to Firebase

  void printControllers() {
    print(_controllers?.length);
    print(_controllers![1].text);
  }

  void itemSelectionChanged(String? d) {
    print(d);
  }

  Future setPositions(_controllers) async {
    await FirebaseFirestore.instance.collection('positions').add({
      'Position 1': _controllers[0].text,
    });
    print('Positions updated');
  }

// collection reference
  final CollectionReference positionCollection =
      FirebaseFirestore.instance.collection('positions');

  Future updatePositions(_controllers) async {
    await positionCollection.doc('5FxrbaLGdzB6YUjhkpe8').set({
      'Position 1': _controllers[0].text,
      'Position 2': _controllers[1].text,
      'Position 3': _controllers[2].text,
      'Position 4': _controllers[3].text,
      'Position 5': _controllers[4].text,
      'Position 6': _controllers[5].text,
      'Position 7': _controllers[6].text,
      'Position 8': _controllers[7].text,
      'Position 9': _controllers[8].text,
      'Position 10': _controllers[9].text,
    });
    print('Positions Added');
  }

  Future getPositions(_controllers) async {
    var data = await positionCollection.doc('5FxrbaLGdzB6YUjhkpe8').get();

    _controllers[0].text = data.get('Position 1');
    _controllers[1].text = data.get('Position 2');
    _controllers[2].text = data.get('Position 3');
    _controllers[3].text = data.get('Position 4');
    _controllers[4].text = data.get('Position 5');
    _controllers[5].text = data.get('Position 6');
    _controllers[6].text = data.get('Position 7');
    _controllers[7].text = data.get('Position 8');
    _controllers[8].text = data.get('Position 9');
    _controllers[9].text = data.get('Position 10');
  }

  Future getIngredientsFromPositons(currrentIngredients) async {
    // collection reference
    final CollectionReference positionCollection =
        FirebaseFirestore.instance.collection('positions');

    var data = await positionCollection.doc('5FxrbaLGdzB6YUjhkpe8').get();

    currentIngredients.clear();
    currentIngredients.add(data.get('Position 1'));
    currentIngredients.add(data.get('Position 2'));
    currentIngredients.add(data.get('Position 3'));
    currentIngredients.add(data.get('Position 4'));
    currentIngredients.add(data.get('Position 5'));
    currentIngredients.add(data.get('Position 6'));
    currentIngredients.add(data.get('Position 7'));
    currentIngredients.add(data.get('Position 8'));
    currentIngredients.add(data.get('Position 9'));
    currentIngredients.add(data.get('Position 10'));

    print(currrentIngredients);
  }

  Future deleteDocsFromCollection() async {
    var collection = FirebaseFirestore.instance.collection('cocktails');
    var snapshot = await collection.get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
      print('all docs in collection cocktails deleted');
    }
  }

  Future getCocktailsFromCocktailsDatabase() async {
    var data =
        await FirebaseFirestore.instance.collection('all cocktails').get();

    setState(() {
      CocktailDatabaseList =
          List.from(data.docs.map((doc) => CocktailMod.fromSnapshot(doc)));
    });
    print(CocktailDatabaseList);
  }

  Future checkAndAddAvailableCocktails(CocktailDatabaseList) async {
    for (var doc in CocktailDatabaseList) {
      if (doc.name == 'Screw Driver') {
        print('Screw Drriver find.');
      }
    }
  }
}
