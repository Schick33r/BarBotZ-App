import 'package:barbotzapp/screens/cocktail_details.dart';
import 'package:flutter/material.dart';
import 'package:barbotzapp/models/globals.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/cocktail.dart';

class CocktailCard extends StatelessWidget {
  final Cocktail cocktail;
  const CocktailCard({Key? key, required this.cocktail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 25),
      child: Container(
        height: 640,
        // color: Colors.red,
        child: Stack(
          children: [
            // Big Rectangle Container
            Padding(
                padding: EdgeInsets.only(
                  top: 50,
                ),
                child: Container(
                  height: 560,
                  decoration: BoxDecoration(
                    color: CC_RectangleBigLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                )),
            // Small Rectangle Container
            Container(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 525,
                  width: MediaQuery.of(context).size.width * 0.73,
                  decoration: BoxDecoration(
                    color: CC_RectangleSmallLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                )),
            // Details Button Container
            Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                ),
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 45,
                      width: 150,
                      child: ElevatedButton(
                        child: Text('See Details', style: CC_ButtonTextStyle),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    CocktailDetailsPage(cocktail: cocktail)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: CC_ButtonBackground,
                        ),
                      ),
                    ))),
            // Picture Container
            Container(
                child: Positioned(
              height: 650,
              top: -125,
              child: Image.asset(cocktail.imageUrl),
            )),

            // Title Container
            Padding(
                padding: EdgeInsets.only(
                  bottom: 62,
                ),
                child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      cocktail.cocktailName,
                      style: GoogleFonts.bigShouldersStencilText(
                          fontSize: 36, color: CocktailTitle),
                    )))
          ],
        ),
      ),
    );
  }
}
