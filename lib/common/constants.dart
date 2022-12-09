// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
const apiKey = 'api_key=d1466fe417c13715d3f99df32706ca6d';
const baseUrl = 'https://api.themoviedb.org/3';

// colors
const Color cRichBlack = Color(0xFF1D1D1D);
const Color cRichGrey = Color(0xFF707070);
const Color cMikadoYellow = Color(0xFFFFA600);
const Color cDavysGrey = Color(0xFF4B5358);
const Color cGrey = Color(0xFF303030);

// text style
final TextStyle cHeading5 =
    GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.w400);
final TextStyle cHeading6 = GoogleFonts.poppins(
    fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15);
final TextStyle cSubtitle = GoogleFonts.poppins(
    fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15);
final TextStyle cBodyText = GoogleFonts.poppins(
    fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25);

// text theme
final cTextTheme = TextTheme(
  headline5: cHeading5,
  headline6: cHeading6,
  subtitle1: cSubtitle,
  bodyText2: cBodyText,
);

const cColorScheme = ColorScheme(
  primary: cMikadoYellow,
  primaryContainer: cMikadoYellow,
  secondary: cRichGrey,
  secondaryContainer: cRichGrey,
  surface: cRichBlack,
  background: cRichBlack,
  error: Colors.red,
  onPrimary: cRichBlack,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.dark,
);
