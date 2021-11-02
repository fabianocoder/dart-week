import 'package:flutter/material.dart';

class FilmesAppUiConfig {
  FilmesAppUiConfig._();
  static String get title => 'Filmes app';
  static ThemeData get theme => ThemeData(
        fontFamily: 'Metropolis',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
