// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

ThemeData theme(){
  return  ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme:appBarTheme(),
    fontFamily:"Muli",
    textTheme: textTheme(),
    primaryColor: Constants.containerColor,
    inputDecorationTheme: inputDecorationTheme(),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide:BorderSide(
        color:Constants.kTextColor,
        width: 1.3
    ),
    gapPadding: 10,

  );
  return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelStyle: TextStyle(
        color: Constants.kTextColor,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 42,vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return TextTheme(
      bodyText1: TextStyle(color: Constants.kTextColor),
      bodyText2: TextStyle(color: Constants.kTextColor));
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(
        color: Colors.black
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Color(0XFF8B8B8B),
        fontSize: 18,
      ),
    ),
  );
}