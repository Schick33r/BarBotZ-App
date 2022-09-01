import 'package:barbotzapp/widgets/cocktail_card.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:barbotzapp/models/cocktail.dart';
import 'package:barbotzapp/models/cocktail_model.dart';
import 'dart:async';
import 'package:textfield_search/textfield_search.dart';

class CreateNewCocktail extends StatefulWidget {
  const CreateNewCocktail({Key? key}) : super(key: key);

  @override
  State<CreateNewCocktail> createState() => _CreateNewCocktailState();
}

class _CreateNewCocktailState extends State<CreateNewCocktail> {
  final _testList = [
    'Test Item 1',
    'Test Item 2',
    'Test Item 3',
    'Test Item 4',
  ];

  final _amountList = [
    '10 cl',
    '20 cl',
    '30 cl',
    '40 cl',
    '50 cl',
    '60 cl',
    '70 cl',
    '80 cl',
    '90 cl',
    '100 cl',
  ];

  TextEditingController _cocktailNameController = TextEditingController();
  TextEditingController _pictureController = TextEditingController();
  TextEditingController _ingredients1NameController = TextEditingController();
  TextEditingController _ingredients1AmountController = TextEditingController();
  TextEditingController _ingredients2NameController = TextEditingController();
  TextEditingController _ingredients2AmountController = TextEditingController();
  TextEditingController _ingredients3NameController = TextEditingController();
  TextEditingController _ingredients3AmountController = TextEditingController();
  TextEditingController _ingredients4NameController = TextEditingController();
  TextEditingController _ingredients4AmountController = TextEditingController();

  @override
  void dispose() {
    _cocktailNameController.dispose();
    //_controller2.dispose();
    //_controller3.dispose();
    super.dispose();
  }

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
        backgroundColor: Colors.brown[700],
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.brown[800],
          title: Text('Create your own Cocktail'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),

              // Cocktailname textfield
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: TextField(
                    controller: _cocktailNameController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100),
                        // borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepOrange.shade200),
                        //borderRadius: BorderRadius.circular(12.0),
                      ),
                      hintText: 'Name your Cocktail',
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.brown[800],
                      filled: true,
                    ),
                  )),

              const SizedBox(height: 20),

              // Cocktailpicture textfield
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: TextField(
                    controller: _pictureController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepOrange.shade200),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      hintText: 'Picturename',
                      hintStyle: TextStyle(color: Colors.white),
                      fillColor: Colors.brown[800],
                      filled: true,
                    ),
                  )),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 35.0),
                    child: SizedBox(
                      height: 35,
                      child: ElevatedButton(
                        child: const Text('Select Picture'),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.brown[500]),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Ingredient 1 Name & Amount:
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: SizedBox(
                      width: 180,
                      child: TextFieldSearch(
                          //decoration: InputDecoration(),
                          initialList: _testList,
                          label: 'Ingredient 1:',
                          controller: _ingredients1NameController),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFieldSearch(
                        //decoration: InputDecoration(),
                        initialList: _amountList,
                        label: 'Amount in CL:',
                        controller: _ingredients1AmountController),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Ingredient 2 Name & Amount
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: SizedBox(
                      width: 180,
                      child: TextFieldSearch(
                          //decoration: InputDecoration(),
                          initialList: _testList,
                          label: 'Ingredient 2:',
                          controller: _ingredients2NameController),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFieldSearch(
                        //decoration: InputDecoration(),
                        initialList: _amountList,
                        label: 'Amount in CL:',
                        controller: _ingredients2AmountController),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Ingredient 3 Name & Amount
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: SizedBox(
                      width: 180,
                      child: TextFieldSearch(
                          //decoration: InputDecoration(),
                          initialList: _testList,
                          label: 'Ingredient 3:',
                          controller: _ingredients3NameController),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFieldSearch(
                        //decoration: InputDecoration(),
                        initialList: _amountList,
                        label: 'Amount in CL:',
                        controller: _ingredients3AmountController),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Ingredient 4 Name & Amount
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: SizedBox(
                      width: 180,
                      child: TextFieldSearch(
                          //decoration: InputDecoration(),
                          initialList: _testList,
                          label: 'Ingredient 4:',
                          controller: _ingredients4NameController),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 100,
                    child: TextFieldSearch(
                        //decoration: InputDecoration(),
                        initialList: _amountList,
                        label: 'Amount in CL:',
                        controller: _ingredients4AmountController),
                  ),
                ],
              ),

              const SizedBox(height: 60),
              ElevatedButton(
                child: Text('Add Cocktail - all cocktails'),
                onPressed: () {
                  // CreateAndAddNewCocktail('Malibu Sunrise');
                },
                style:
                    ElevatedButton.styleFrom(primary: Colors.deepOrange[400]),
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                child: Text('Add Cocktail - available cocktails'),
                onPressed: () {
                  CreateCocktailToAvailable(
                      _cocktailNameController.text.trim());
                },
                style: ElevatedButton.styleFrom(primary: Colors.redAccent[400]),
              ),
            ],
          ),
        ));
  }
}

Future CreateCocktailToAll(String cocktailName) async {
  await FirebaseFirestore.instance.collection('all cocktails').add({
    'cocktailName': cocktailName,
    'imageUrl': 'assets/screw_driver.png',
    'ingredients': [
      {
        'name': 'Vodka',
        'amount': 100,
      },
      {'name': 'Apple', 'amount': 400}
    ]
  });
  print('Cocktail Added');
}

Future CreateCocktailToAvailable(String cocktailName) async {
  await FirebaseFirestore.instance.collection('available cocktails').add({
    'cocktailName': cocktailName,
    'imageUrl': 'assets/screw_driver.png',
    'ingredients': [
      {
        'name': 'Vodka',
        'amount': 100,
      },
      {'name': 'Apple', 'amount': 400}
    ]
  });
  print('Cocktail Added');
}
