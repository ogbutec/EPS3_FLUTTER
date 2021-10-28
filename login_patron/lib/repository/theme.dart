import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_patron/repository/theme.dart';

final theme = ThemeData(
    textTheme: GoogleFonts.robotoTextTheme(),
    primaryColorDark: const Color(0xFF0097A7),
    primaryColorLight: const Color(0xFFB2EBF2),
    primaryColor: const Color(0XFF00BCD4),
    accentColor: const Color(0xFF009688),
    scaffoldBackgroundColor: const Color(0XFF00F2F1),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))));


//25/10/2021 --->