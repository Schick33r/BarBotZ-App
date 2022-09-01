import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:barbotzapp/widgets/cocktail_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:barbotzapp/models/cocktail_model.dart';
import 'dart:async';

class AvailableCocktails extends StatefulWidget {
  const AvailableCocktails({Key? key}) : super(key: key);

  @override
  State<AvailableCocktails> createState() => _AvailableCocktailsState();
}

class _AvailableCocktailsState extends State<AvailableCocktails> {
  List<CocktailMod> AvailableCocktailsList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    getCocktailsFromAvailableCocktails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[500],

      body: Column(
        children: [
          const SizedBox(height: 47),

          Container(
              height: 3,
              width: MediaQuery.of(context).size.width / 1.365, //2.02,
              color: Colors.brown[900]),
          // BARBOTZ

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.brown[900]
                      //Color(0xffac8a75)
                      )),

              const SizedBox(width: 40),

              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: 59,
                      child: Text(
                        'BARBOTZ',
                        style: GoogleFonts.bigShouldersStencilText(
                            color: Colors.brown[900],
                            fontSize: 60,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  Text(
                    'PERFECT MIXED COCKTAILS',
                    style: GoogleFonts.montserrat(
                        color: Colors.brown[200],
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),

              // INVISIBLE AND UNUSED BUTTON FOR SYMETRIC
              const SizedBox(width: 40),

              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.brown[500],
                  )),
            ],
          ),

          const SizedBox(height: 5),

          Container(
              height: 3,
              width: MediaQuery.of(context).size.width / 1.365, //2.02,
              color: Colors.brown[900]),

          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: AvailableCocktailsList.length,
                itemBuilder: (context, index) {
                  return CocktailCard(cocktail: AvailableCocktailsList[index]);
                }),
          ),
        ],
      ),
      // body:
    );
  }

  Future getCocktailsFromAvailableCocktails() async {
    var data = await FirebaseFirestore.instance
        .collection('available cocktails')
        .get();

    setState(() {
      AvailableCocktailsList =
          List.from(data.docs.map((doc) => CocktailMod.fromSnapshot(doc)));
    });
    print(AvailableCocktailsList);
  }
}
