import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/appcolors.dart';
import '../constants/appfonts.dart';

Color themecolor = primarySwatch;
ThemeData theme(BuildContext context) {
  return ThemeData(
    textTheme: GoogleFonts.montserratTextTheme(), //fontstyle for app
    useMaterial3: true,
    primaryColor: themecolor,
    appBarTheme: AppBarTheme(
      // color: themecolor,
      backgroundColor: themecolor,
      centerTitle: true,
      titleTextStyle: Fonts().h2l(context).copyWith(
            fontWeight: FontWeight.bold,
            color: white,
          ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: themecolor,
    ),
    buttonTheme: ButtonThemeData(buttonColor: themecolor),
    bottomAppBarTheme: BottomAppBarTheme(
      color: themecolor,
    ),
    textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(alignment: Alignment.center)),
    iconTheme: const IconThemeData(color: white),
    primaryIconTheme: const IconThemeData(color: white),
    actionIconTheme: const ActionIconThemeData(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: blue,
    ),
    colorScheme: ColorScheme(
      background: white,
      brightness: Brightness.light,
      primary: darkgreen,
      onPrimary: themecolor,
      secondary: ash,
      onSecondary: white,
      error: red,
      onError: red,
      onBackground: white,
      surface: white,
      onSurface: white,
    ),
  );
}
