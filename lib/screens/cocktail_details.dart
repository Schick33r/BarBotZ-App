import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/cocktail.dart';

class CocktailDetailsPage extends StatefulWidget {
  final Cocktail cocktail;

  const CocktailDetailsPage({Key? key, required this.cocktail})
      : super(key: key);

  @override
  State<CocktailDetailsPage> createState() => _CocktailDetailsPageState();
}

class _CocktailDetailsPageState extends State<CocktailDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[900],
          elevation: 0.0,
          title: Text('Details'),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.brown[800],
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 25),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.cocktail.cocktailName,
                      style: GoogleFonts.bigShouldersStencilText(
                          fontSize: 43,
                          fontWeight: FontWeight.w600,
                          color: Colors.deepOrange[200]),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0.0,
                height: 340.0,
                width: MediaQuery.of(context).size.width,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.deepOrange[100],
                        borderRadius: BorderRadius.circular(25))),
              ),
              Positioned(
                bottom: 40,
                width: 300,
                left: MediaQuery.of(context).size.width / 2 - 150,
                child: Column(
                  children: [
                    // Ingredient 1:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.cocktail.ingredients[0].toString(),
                          style: GoogleFonts.montserrat(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                        Text(
                          '2 cl',
                          style: GoogleFonts.montserrat(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Ingredient 2:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.cocktail.ingredients[1].toString(),
                          style: GoogleFonts.montserrat(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          '4 cl',
                          style: GoogleFonts.montserrat(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
