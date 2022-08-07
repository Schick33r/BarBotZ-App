import 'package:barbotzapp/get_data/get_user_name.dart';
import 'package:barbotzapp/widgets/cocktail_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  // document ID´s
  List<String> docIds = [];

  // get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIds.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[500],
        appBar: AppBar(
          toolbarHeight: 75,
          elevation: 0,
          backgroundColor: Colors.brown[700],
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "BARBOT.Z",
                style: GoogleFonts.bigShouldersStencilText(
                  color: Colors.brown[900],
                  fontSize: 45,
                  fontWeight: FontWeight.w900,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '\nPERFECT MIXED COCKTAILS',
                    style: GoogleFonts.montserrat(
                        color: Colors.brown[200],
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                ]),
          ),
          actions: [
            GestureDetector(
              onTap: (() {
                FirebaseAuth.instance.signOut();
              }),
              child: Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: Icon(
                  Icons.logout,
                  size: 30,
                  color: Colors.deepOrange[100],
                ),
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(height: 15),
              // Text('signed in as: ${user.email!}'),
              Expanded(
                  child: FutureBuilder(
                future: getDocId(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: docIds.length,
                    itemBuilder: (context, index) {
                      //return Container();

                      //CocktailCard();
                      return ListTile(
                          title: GetUserName(documentId: docIds[index]));
                    },
                  );
                },
              )),
            ],
          ),
        ));
  }
}
