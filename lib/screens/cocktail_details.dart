import 'package:barbotzapp/models/cocktail_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import '../models/cocktail.dart';
import '../models/globals.dart';

class CocktailDetailsPage extends StatefulWidget {
  final CocktailMod cocktail;

  const CocktailDetailsPage({Key? key, required this.cocktail})
      : super(key: key);

  @override
  State<CocktailDetailsPage> createState() => _CocktailDetailsPageState();
}

class _CocktailDetailsPageState extends State<CocktailDetailsPage> {
  double progress = 0.0;

  bool orderButton = true;
  bool progressRun = true;
  bool _isVisible = false;

  void snackTrue() {
    setState(() {
      _isVisible = true;
      // _isVisible = !_isVisible;
    });
  }

  void snackFalse() {
    setState(() {
      _isVisible = false;
      // _isVisible = !_isVisible;
    });
  }

  void progressChange() {
    setState(() {
      progressRun = false;
      // _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.cocktail.ingredients.length);
    int ingLength = widget.cocktail.ingredients.length;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[800],
          elevation: 0.0,
          toolbarHeight: 68,
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'BARBOTZ',
                style: GoogleFonts.bigShouldersStencilText(
                    fontSize: 55,
                    fontWeight: FontWeight.w900,
                    color: Colors.brown[900]),
                children: <TextSpan>[
                  TextSpan(
                    text: '\nPERFECT MIXED COCKTAILS',
                    style: TextStyle(
                        height: 0.2,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Montserral',
                        color: Colors.brown[200]),
                  ),
                ]),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Color(0xffac8a75)),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.brown[800],
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 25),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.cocktail.cocktailName,
                      style: GoogleFonts.bigShouldersStencilText(
                          fontSize: 42,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFe2a08a)),
                    ),
                  ),
                ],
              ),

              // Ingredients Background
              Positioned(
                bottom: 0.0,
                height: 320.0,
                width: MediaQuery.of(context).size.width,
                child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xFFac8a75),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)))),
              ),

              // INGREDIENTS WIDGET
              showIngredients(widget.cocktail, context, ingLength),

              // Cocktail Picture
              Positioned(
                height: 500,
                width: 290,
                top: 0,
                left: -35,
                child: Image.asset(widget.cocktail.imageUrl),
              ),
              Positioned(
                  height: 50,
                  width: 165,
                  right: 30,
                  bottom: 300,
                  child: Container(
                    child: ElevatedButton(
                        onPressed: orderButton
                            ? () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (context) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                          dialogBackgroundColor:
                                              Color(0xFFac8a75)),
                                      child: new SimpleDialog(
                                        title: new Text("Confirm your Order?"),
                                        children: <Widget>[
                                          Row(
                                            children: [
                                              new SimpleDialogOption(
                                                child: Text('Order Cocktail',
                                                    style:
                                                        ShowDialog_Order_Button_Style),
                                                onPressed: () {
                                                  Navigator.pop(context);

                                                  Timer.periodic(
                                                      Duration(
                                                          milliseconds: 20),
                                                      (timer) {
                                                    if (progress > 100)
                                                      timer.cancel();

                                                    if (mounted) {
                                                      setState(() {
                                                        if (progress < 100)
                                                          progress += 1;
                                                        if (progressRun ==
                                                            true) {
                                                          if (progress == 100) {
                                                            progressRun ==
                                                                false;

                                                            snackTrue();
                                                          }
                                                        }
                                                      });
                                                    }
                                                  });
                                                },
                                              ),
                                              new SimpleDialogOption(
                                                child: Text('Cancel',
                                                    style:
                                                        ShowDialog_Cancel_Button_Style),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );

                                // Timer.periodic(Duration(milliseconds: 100), (timer) {
                                //   if (progress > 100) timer.cancel();

                                //   if (mounted) {
                                //     setState(() {
                                //       if (progress < 100) progress += 1;
                                //     });
                                //   }
                                // });
                              }
                            : null,
                        child: const Text(
                          'Order Cocktail!',
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF945b3d),
                            onPrimary: Color(0xFFd5beb1),
                            shadowColor: Color(0xFF856b5c),
                            elevation: 3,
                            textStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ))),
                  )),
            ],
          ),
        ));
  }
}

showIngredients(cocktail, context, ingLength) {
  // assert(cocktail != null);

  // --- 4 INGREDIENTS :
  if (ingLength == 4) {
    return Positioned(
      top: 490,
      width: 300,
      left: MediaQuery.of(context).size.width / 2 - 150,
      child: Column(
        children: [
          // Ingredient 1:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cocktail.ingredients[0]['name'],
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF3c3029)),
              ),
              Text(
                (cocktail.ingredients[0]['amount'] / 10).toStringAsFixed(0) +
                    " cl",
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF3c3029)),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Ingredient 2:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cocktail.ingredients[1]['name'],
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF3c3029)),
              ),
              Text(
                (cocktail.ingredients[1]['amount'] / 10).toStringAsFixed(0) +
                    " cl",
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF3c3029)),
              ),
            ],
          ),

          const SizedBox(height: 20),
          // Ingredient 3:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cocktail.ingredients[2]['name'],
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF3c3029)),
              ),
              Text(
                (cocktail.ingredients[2]['amount'] / 10).toStringAsFixed(0) +
                    " cl",
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF3c3029)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Ingredient 4:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cocktail.ingredients[3]['name'],
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF3c3029)),
              ),
              Text(
                (cocktail.ingredients[3]['amount'] / 10).toStringAsFixed(0) +
                    " cl",
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF3c3029)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- 3 INGREDIENTS :
  if (ingLength == 3) {
    return Positioned(
      top: 490,
      width: 300,
      left: MediaQuery.of(context).size.width / 2 - 150,
      child: Column(
        children: [
          // Ingredient 1:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cocktail.ingredients[0]['name'],
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF3c3029)),
              ),
              Text(
                (cocktail.ingredients[0]['amount'] / 10).toStringAsFixed(0) +
                    " cl",
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF3c3029)),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Ingredient 2:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cocktail.ingredients[1]['name'],
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF3c3029)),
              ),
              Text(
                (cocktail.ingredients[1]['amount'] / 10).toStringAsFixed(0) +
                    " cl",
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF3c3029)),
              ),
            ],
          ),

          const SizedBox(height: 20),
          // Ingredient 3:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cocktail.ingredients[2]['name'],
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF3c3029)),
              ),
              Text(
                (cocktail.ingredients[2]['amount'] / 10).toStringAsFixed(0) +
                    " cl",
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF3c3029)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- 2 INGREDIENTS :
  if (ingLength == 2) {
    return Positioned(
      top: 490,
      width: 300,
      left: MediaQuery.of(context).size.width / 2 - 150,
      child: Column(
        children: [
          // Ingredient 1:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cocktail.ingredients[0]['name'],
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF3c3029)),
              ),
              Text(
                (cocktail.ingredients[0]['amount'] / 10).toStringAsFixed(0) +
                    " cl",
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF3c3029)),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Ingredient 2:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cocktail.ingredients[1]['name'],
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF3c3029)),
              ),
              Text(
                (cocktail.ingredients[1]['amount'] / 10).toStringAsFixed(0) +
                    " cl",
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF3c3029)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
