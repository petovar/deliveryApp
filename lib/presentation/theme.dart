import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryColors {
  static const purple = Color(0xff5117ac);
  static const green = Color(0xff20d0c4);
  static const dark = Color(0xff03091e);
  static const grey = Color(0xff212738);
  static const lightGrey = Color(0xffbbbbbb);
  static const veryLightGrey = Color(0xfff3f3f3);
  static const white = Color(0xffffffff);
  static const pink = Color(0xfff5638b);
}

final deliveryGradients = [
  DeliveryColors.green,
  DeliveryColors.purple,
];

final _ligthBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: const BorderSide(
    color: DeliveryColors.lightGrey,
    width: 2,
    style: BorderStyle.solid,
  ),
);

final _darkBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: const BorderSide(
    // color: DeliveryColors.grey,
    // width: 0,
    style: BorderStyle.none,
  ),
);

final lightTheme = ThemeData(
  primaryColor: DeliveryColors.white,
  primaryColorLight: DeliveryColors.veryLightGrey,
  secondaryHeaderColor: DeliveryColors.purple,
  dividerColor: DeliveryColors.purple,
  // canvasColor: DeliveryColors.purple,
  appBarTheme: const AppBarTheme(
      color: DeliveryColors.white,
      titleTextStyle: TextStyle(color: DeliveryColors.purple)),
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: DeliveryColors.purple,
    displayColor: DeliveryColors.purple,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: _ligthBorder,
    enabledBorder: _ligthBorder,
    focusedBorder: _ligthBorder,
    prefixIconColor: DeliveryColors.purple,
    iconColor: DeliveryColors.purple,
    hintStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 12, color: DeliveryColors.grey)),
  ),
);

final darkTheme = ThemeData(
  primaryColor: DeliveryColors.grey,
  primaryColorLight: Colors.transparent,
  secondaryHeaderColor: DeliveryColors.lightGrey,
  dividerColor: DeliveryColors.white,
  // canvasColor: DeliveryColors.white,
  appBarTheme: const AppBarTheme(
      color: DeliveryColors.purple,
      titleTextStyle: TextStyle(color: DeliveryColors.white)),
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: DeliveryColors.green,
    displayColor: DeliveryColors.green,
  ),
  scaffoldBackgroundColor: DeliveryColors.dark,
  inputDecorationTheme: InputDecorationTheme(
    border: _darkBorder,
    enabledBorder: _darkBorder,
    focusedBorder: _darkBorder,
    fillColor: DeliveryColors.grey,
    prefixIconColor: DeliveryColors.lightGrey,
    iconColor: DeliveryColors.lightGrey,
    hintStyle: GoogleFonts.poppins(
        textStyle:
            const TextStyle(fontSize: 12, color: DeliveryColors.lightGrey)),
  ),
);
