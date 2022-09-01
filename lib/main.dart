import 'package:barbotzapp/auth/main_page.dart';
import 'package:barbotzapp/models/cocktail.dart';
import 'package:barbotzapp/screens/available_cocktails.dart';
import 'package:barbotzapp/screens/cocktail_database.dart';
import 'package:barbotzapp/screens/cocktail_details.dart';
import 'package:barbotzapp/screens/create_new_cocktail.dart';
import 'package:barbotzapp/screens/menu_page.dart';
import 'package:barbotzapp/screens/select_cocktail_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:barbotzapp/screens/login_page.dart';
import 'screens/change_bottles.dart';
import 'firebase_options.dart';
import 'package:flutter/services.dart';
import 'package:barbotzapp/example/cocktails.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        Color(0xFFac8a75), //Colors.black87, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // initRoute -> MainPage()
        '/': (context) => MainPage(),

        // MENU
        '/MenuPage': (context) => MenuPage(),

        '/AvailableCocktails': (context) => AvailableCocktails(),

        '/CreateCocktail': (context) => CreateNewCocktail(),

        '/CocktailDatabase': (context) => CocktailDatabase(),

        '/ChangeBottles': (context) => ChangeBottles(cocktails: Cocktails)
      },
      //home: MainPage(),
    );
  }
}
