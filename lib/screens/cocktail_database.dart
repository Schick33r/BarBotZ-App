import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:barbotzapp/widgets/cocktail_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:barbotzapp/models/cocktail_model.dart';
import 'dart:async';

// HERE ARE SHOWN ALL COCKTAILS FROM THE DATABASE
// not all cocktails can be mixed with the current bottles

class CocktailDatabase extends StatefulWidget {
  const CocktailDatabase({Key? key}) : super(key: key);

  @override
  State<CocktailDatabase> createState() => _CocktailDatabaseState();
}

class _CocktailDatabaseState extends State<CocktailDatabase> {
  List<CocktailMod> CocktailDatabaseList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getCocktailsFromCocktailsDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[500],
      // appBar: AppBar(),

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
                itemCount: CocktailDatabaseList.length,
                itemBuilder: (context, index) {
                  return CocktailCard(cocktail: CocktailDatabaseList[index]);
                }),
          ),
        ],
      ),
    );
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
}
