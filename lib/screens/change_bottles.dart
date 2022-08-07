import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class ChangeBottles extends StatefulWidget {
  const ChangeBottles({Key? key}) : super(key: key);

  @override
  State<ChangeBottles> createState() => _ChangeBottlesState();
}

class _ChangeBottlesState extends State<ChangeBottles> {
  List<String> ingredients = [
    "Vodka",
    "Peachliqeur",
    "Orangejuice",
    "Cranberryjuice"
  ];

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
            child: Icon(
              Icons.save_outlined,
              size: 28,
              color: Colors.deepOrange[200],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownSearch<String>(
                        mode: Mode.MENU,
                        showSelectedItems: true,
                        items: ingredients,
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Position. " + ((index + 1).toString()),
                          labelStyle: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          hintText: "Select an ingredient",
                        ),
                        //popupItemDisabled: isItemDisabled,
                        onChanged: itemSelectionChanged,
                        //selectedItem: "",
                        showSearchBox: true,
                        searchFieldProps: TextFieldProps(
                          cursorColor: Colors.deepOrange[100],
                          decoration: InputDecoration(
                            hintText: "Search Ingredients",
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.brown.shade400),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.deepOrange.shade200),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15)
              ],
            );
          },
        ),
      ),
    );
  }

  // bool isItemDisabled(String s) {
  //   //return s.startsWith('I');

  //   if (s.startsWith('I')) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  void itemSelectionChanged(String? d) {
    print(d);
  }
}
