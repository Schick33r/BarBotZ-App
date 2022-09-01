import 'package:flutter/material.dart';

// ALLES AUSKOMMENTIERT WEGEN COMP FEHLERN


// Future getCocktailsFromFirebaseList() async {
//     var data =
//         await FirebaseFirestore.instance.collection('all cocktails').get();

//     setState(() {
//       gettedCocktailsList =
//           List.from(data.docs.map((doc) => CocktailMod.fromSnapshot(doc)));
//     });
//     print(gettedCocktailsList);
//   }




// final _fireStore = FirebaseFirestore.instance;
// Future<void> getData() async {
//   // Get docs from collection reference
//   QuerySnapshot querySnapshot =
//       await _fireStore.collection('all cocktails').get();
//   ;

//   // Get data from docs and convert map to List
//   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
//   //for a specific field
//   // final allData =
//   //     querySnapshot.docs.map((doc) => doc.get('fieldName')).toList();

//   print(allData);
// }



// this for the cocktails.dart - model

// Future<List<Cocktail>> gettedCocktails() async {
//   print('getted Cocktails:');
//   var val = await _fireStore.collection("all cocktails").get();
//   var documents = val.docs;
//   print(documents);
//   return documents.map((document) {
//     Cocktail cocktailList =
//         Cocktail.fromJson(Map<String, dynamic>.from(document.data()));

//     return cocktailList;
//   }).toList();
// }

// this for the cocktails_model.dart - model

//
// Future<List<CocktailMod>> gettedCocktails() async {
//   print('getted Cocktails:');
//   var val = await _fireStore.collection("all cocktails").get();
//   var documents = val.docs;
//   print(documents);
//   return documents.map((document) {
//     CocktailMod cocktailList =
//         CocktailMod.fromJson(Map<String, dynamic>.from(document.data()));

//     return cocktailList;
//   }).toList();
// }








                      // DropdownSearch<String>(
                      //   mode: Mode.MENU,
                      //   showSelectedItems: true,
                      //   items: ingredients,

                      //   dropdownSearchDecoration: InputDecoration(
                      //     labelText: "Position. " + ((index + 1).toString()),
                      //     labelStyle: TextStyle(
                      //         fontSize: 16, fontWeight: FontWeight.w600),
                      //     hintText: "Select an ingredient",
                      //   ),

                      //   //popupItemDisabled: isItemDisabled,
                      //   onChanged: itemSelectionChanged,

                      //   //selectedItem: "",
                      //   showSearchBox: true,

                      //   searchFieldProps: TextFieldProps(
                      //     controller: _controllers?[index],
                      //     cursorColor: Colors.deepOrange[100],
                      //     decoration: InputDecoration(
                      //       hintText: "Search Ingredients",
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide:
                      //             BorderSide(color: Colors.brown.shade400),
                      //         borderRadius: BorderRadius.circular(12.0),
                      //       ),
                      //       focusedBorder: OutlineInputBorder(
                      //         borderSide:
                      //             BorderSide(color: Colors.deepOrange.shade200),
                      //         borderRadius: BorderRadius.circular(12.0),
                      //       ),
                      //     ),
                      //   ),
                      // ),




  
// void setAvailableCocktails(cocktail) {
//   print(cocktail.length);
//   // List cocktails = cocktail;
//   // cocktails.forEach((element) {
//   //   print(cocktail.ingrdients.name);
//   // });

//   for (var element in cocktail) {
//     // var details = {'Usrname': 'tom', 'Password': 'pass@123'};
//     // print(details.values);
//     // List newListe = details.values.toList();

//     // List newList = element.ings;
//     // List onlyVal = newList.keys.toList()
//     // print(newListw);

//     print(element.name);
//     //print(element.ings);

//     List<Map> Ings = element.ings;
//     print(Ings);
//     print(Ings.length);

//     print(element.ings);
//     // var combinedMap = {for (var map in Ings) ...map};
//     // print(combinedMap);
//     // print(combinedMap.length);

//     // var w = Ings.reduce((a, b) {
//     //   a.addAll(b);
//     //   return a;
//     // });

//     for (var item in Ings) {
//       print(item.values);
//     }

//     // print(w.runtimeType);
//   }
// }