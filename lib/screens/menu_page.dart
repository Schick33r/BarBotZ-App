import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[700],
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 70),
            // BARBOTZ
            Container(
              height: 59,
              child: Text(
                'BARBOTZ',
                style: GoogleFonts.bigShouldersStencilText(
                    color: Colors.brown[900],
                    fontSize: 60,
                    fontWeight: FontWeight.w900),
              ),
            ),

            Text(
              'PERFECT MIXED COCKTAILS',
              style: GoogleFonts.montserrat(
                  color: Colors.brown[200],
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
            ),

            const SizedBox(height: 120),

            Container(
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width / 1.3,
              decoration: BoxDecoration(
                  color: Colors.brown[900],
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: Text('Available Cocktails',
                      style: GoogleFonts.bebasNeue(
                          color: Colors.deepOrange[200],
                          fontSize: 28,
                          fontWeight: FontWeight.w100))),
            ),

            const SizedBox(height: 25),

            Container(
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width / 1.3,
              decoration: BoxDecoration(
                  color: Color.fromARGB(187, 62, 39, 35),
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: Text('Create New Cocktail',
                      style: GoogleFonts.bebasNeue(
                          color: Color.fromARGB(253, 244, 157, 157),
                          fontSize: 28,
                          fontWeight: FontWeight.w100))),
            ),

            const SizedBox(height: 25),

            Container(
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width / 1.3,
              decoration: BoxDecoration(
                  color: Colors.brown[900],
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                  child: Text('Change Bottles',
                      style: GoogleFonts.bebasNeue(
                          color: Colors.deepOrange[200],
                          fontSize: 28,
                          fontWeight: FontWeight.w100))),
            ),

            const SizedBox(height: 80)
          ],
        ),
      )),
    );
  }
}
