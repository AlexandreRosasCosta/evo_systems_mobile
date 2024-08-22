import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts {
  final double? fontSize; 
  final FontWeight fontWeight;

  Fonts({required this.fontSize, required this.fontWeight});

  fontABeeZee() => GoogleFonts.aBeeZee(fontSize: fontSize, fontWeight: fontWeight);
  fontRoboto() => GoogleFonts.roboto(fontSize: fontSize, fontWeight: fontWeight);
  fontBelleza() => GoogleFonts.belleza(fontSize: fontSize, fontWeight: fontWeight);
}