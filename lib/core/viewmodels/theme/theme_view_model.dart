import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machineglow/shared/resources/resources.dart';

class GlowThemeViewModel with ChangeNotifier {
  GlowThemeViewModel();

  ThemeData theme() {
    return ThemeData(
      appBarTheme: appBarTheme(),
      primarySwatch: Colors.green,
      toggleableActiveColor: Colors.white,
      splashColor: kprimaryColor,
      scaffoldBackgroundColor: kbackgroundColor,
      primaryColor: kprimaryColor,
      fontFamily: GoogleFonts.poppins().fontFamily,
      backgroundColor: kbackgroundColor,
      focusColor: kprimaryColorLight,
      textTheme: textTheme(),
      tabBarTheme: tabBarTheme(),
      dividerTheme: const DividerThemeData(color: Colors.grey),
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: Colors.white),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      disabledColor: Colors.grey,
      hintColor: Colors.black,
      textSelectionTheme: TextSelectionThemeData(cursorColor: kprimaryColor),
      indicatorColor: kprimaryColor,
    );
  }

  TextTheme textTheme() {
    return TextTheme(
            headline1: GoogleFonts.poppins(
                color: ktextColor,
                fontSize: (header1FontSize),
                fontWeight: FontWeight.w800),
            headline2: GoogleFonts.poppins(
                color: ktextColor,
                fontSize: (header2FontSize),
                fontWeight: FontWeight.w600),
            headline3: GoogleFonts.poppins(
                color: ktextColor,
                fontSize: (textFontSize),
                fontWeight: FontWeight.w500),
            subtitle1: GoogleFonts.poppins(
                fontSize: (header2FontSize) * 1.4,
                fontWeight: FontWeight.bold,
                color: ktextColor),
            subtitle2: GoogleFonts.poppins(
                fontSize: (header3FontSize) * 1.1,
                fontWeight: FontWeight.bold,
                color: ktextColor),
            bodyText1: GoogleFonts.poppins(
                color: ktextColor,
                fontSize: (textFontSize),
                fontWeight: FontWeight.w400),
            bodyText2: GoogleFonts.poppins(
                color: ktextColor.withOpacity(0.7),
                fontSize: (textFontSize),
                fontWeight: FontWeight.normal),
            caption: GoogleFonts.montserrat(
                color: ktextColor.withOpacity(0.71),
                fontSize: (textFontSize) * 0.6,
                fontWeight: FontWeight.normal))
        .apply(fontFamily: GoogleFonts.poppins().fontFamily);
  }

  TabBarTheme tabBarTheme() {
    return TabBarTheme(
      unselectedLabelColor: ktextColor,
      labelStyle: GoogleFonts.poppins(
        fontSize: (textFontSize),
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontSize: (textFontSize),
        color: ktextColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  AppBarTheme appBarTheme() {
    return AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: kprimaryColor,
      ),
      titleTextStyle: textTheme().headline1,
    );
  }
}
