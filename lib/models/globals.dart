// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// AppBar & Background
Color AppBarBackgroundColor = const Color(0xFF272727);

Color AppbarTextPrimaryColor = const Color(0xFFac8a75);
Color AppbarTextSecondaryColor = const Color(0xFF5e5148);

Color BackgroundPrimaryColor = const Color(0xFF121212);

// Menu Page
Color MenuTextColor = const Color(0xFF795a4f);
Color MenuRectangleDark = const Color(0xFF1e1e1e);
Color MenuRectangleBackgroundDark = const Color(0xFF5b3d2d);

Color MenuRectangleLight = const Color(0xFF2c2c2c);
Color MenuRectangleBackgroundLight = const Color(0xFF5b3d2d);

// Choose Cocktail Page
Color CocktailTitle = const Color(0xFFe2a08a);

Color CC_ButtonBackground = const Color(0xFF955b3e);
Color CC_ButtonTextColor = const Color(0xFFd5bdb1);

Color CC_RectangleBigLight = const Color(0xFF412d23);
Color CC_RectangleSmallLight = const Color(0xFFAB8A75);

Color CC_RectangleBigDark = const Color(0xFF321b10);
Color CC_RectangleSmallDark = const Color(0xFF574439);

// Detail Cocktail Page
Color ProgressbarBackground = const Color(0xFF735b4e);
Color ProgressbarForeground = const Color(0xFFe8935f);

Color ProgressbarText = const Color(0xFFeb9560);

Color DC_ButtonBackground = const Color(0xFF955b3e);
Color DC_ButtonTextColor = const Color(0xFFd5bdb1);

Color IngredentsTextColor = const Color(0xFF3c3029);

Color SnackbarBackground = const Color(0xFF765e50);
Color SnackbarTextColor = const Color(0xFF2f2621);
Color SnackbarIconColor = const Color(0xFF2f2621);

// TextStyle - Choose Cocktail Page
TextStyle CC_TitleStyle = new TextStyle(
  fontFamily: 'Big Shoulders Stencil Text',
  fontSize: 36,
  color: CocktailTitle,
);

TextStyle CC_ButtonTextStyle = new TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 17,
  color: CC_ButtonTextColor,
);

TextStyle ShowDialog_Order_Button_Style = new TextStyle(
    fontFamily: 'Montserrat', fontSize: 16, color: Color(0xFF026C39));

TextStyle ShowDialog_Cancel_Button_Style = new TextStyle(
    fontFamily: 'Montserrat', fontSize: 14, color: Color(0xFFFF0000));

TextStyle CocktailFinishStyle = new TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Color(0xFF2f2621));

TextStyle CocktailFinishSmallStyle = new TextStyle(
    fontFamily: 'Montserrat', fontSize: 14, color: Color(0xFF2f2621));
