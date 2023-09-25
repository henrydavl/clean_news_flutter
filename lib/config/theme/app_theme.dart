import 'package:core/constants/constants.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Muli',
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: isIOS ? true : false,
    iconTheme: const IconThemeData(color: Color(0xFF8B8B8B)),
    titleTextStyle: const TextStyle(color: Color(0xFF8B8B8B), fontSize: 18),
  );
}