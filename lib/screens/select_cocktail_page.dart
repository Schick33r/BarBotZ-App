import 'package:barbotzapp/models/cocktail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:barbotzapp/example/cocktails.dart';
import 'package:barbotzapp/widgets/cocktail_card.dart';

class SelectCocktailPage extends StatelessWidget {
  const SelectCocktailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[500],
        // appBar: AppBar(
        //   toolbarHeight: 75,
        //   elevation: 0,
        //   backgroundColor: Colors.brown[700],
        //   title: RichText(
        //     textAlign: TextAlign.end,
        //     text: TextSpan(
        //         text: "BARBOT.Z",
        //         style: GoogleFonts.bigShouldersStencilText(
        //           color: Colors.brown[900],
        //           fontSize: 45,
        //           fontWeight: FontWeight.w900,
        //         ),
        //         children: <TextSpan>[
        //           TextSpan(
        //             text: '\nPERFECT MIXED COCKTAILS',
        //             style: GoogleFonts.montserrat(
        //                 color: Colors.brown[200],
        //                 fontSize: 14,
        //                 fontWeight: FontWeight.w300),
        //           ),
        //         ]),
        //   ),
        //   actions: [
        //     GestureDetector(
        //       onTap: (() {
        //         FirebaseAuth.instance.signOut();
        //       }),
        //       child: Padding(
        //         padding: EdgeInsets.only(right: 12.0),
        //         child: Icon(
        //           Icons.logout,
        //           size: 30,
        //           color: Colors.deepOrange[100],
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        body: Column(
          children: [
            const SizedBox(height: 47),

            Container(
                height: 3,
                width: MediaQuery.of(context).size.width / 1.365, //2.02,
                color: Colors.brown[900]),
            // BARBOTZ
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

            const SizedBox(height: 5),

            Container(
                height: 3,
                width: MediaQuery.of(context).size.width / 1.365, //2.02,
                color: Colors.brown[900]),

            const SizedBox(height: 10),

            // Expanded(
            //   child: ListView.builder(
            //       shrinkWrap: false,
            //       itemCount: Cocktails.length,
            //       itemBuilder: (context, index) {
            //         return CocktailCard(cocktail: Cocktails[index]);
            //       }),
            // )
          ],
        ));
  }
}
