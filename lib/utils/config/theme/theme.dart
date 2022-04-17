import 'package:flutter/material.dart';
import 'package:skillz/utils/config/theme/colors.dart';
import 'package:woo_theme_mode/woo_theme_mode.dart';
import 'package:google_fonts/google_fonts.dart';

/// mode claire
final themeClaire = WooTheme.modeClair(
  scaffolBackground: ColorCustom().fondClaire,
  primary: ColorCustom().orangeMedium,
  secondary: ColorCustom().blueMedium,
  tbodyPrincipal: GoogleFonts.openSans(fontSize: 20.0),
  tbodySecondaire: GoogleFonts.openSans(fontSize: 16.0),
  tPrincipalBoxDialogue: GoogleFonts.openSans(),
  tButton: GoogleFonts.openSans(),
  tBoxDialogue: GoogleFonts.openSans(),
  t1: GoogleFonts.openSans(color: Colors.black),
  t2: GoogleFonts.openSans(color: Colors.black),
  t3: GoogleFonts.openSans(color: Colors.black),
  t4: GoogleFonts.openSans(color: Colors.black),
  tsmall: GoogleFonts.openSans(color: Colors.black),
);

/// mode dark
final themeDark = WooTheme.modeDark(
  scaffolBackground: ColorCustom().fondDark,
  primary: ColorCustom().orangeMedium,
  secondary: ColorCustom().blueMedium,
  tbodyPrincipal: GoogleFonts.openSans(fontSize: 20.0),
  tbodySecondaire: GoogleFonts.openSans(fontSize: 16.0),
  tPrincipalBoxDialogue: GoogleFonts.openSans(),
  tButton: GoogleFonts.openSans(),
  tBoxDialogue: GoogleFonts.openSans(),
  t1: GoogleFonts.openSans(color: Colors.white),
  t2: GoogleFonts.openSans(color: Colors.white),
  t3: GoogleFonts.openSans(color: Colors.white),
  t4: GoogleFonts.openSans(color: Colors.white),
  tsmall: GoogleFonts.openSans(color: Colors.white),
);
