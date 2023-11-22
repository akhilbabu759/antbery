import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProBlack {
  final Color whitecloProBlack = const Color.fromARGB(255, 255, 255, 255);
  final Color lightBlackcloProBlack = const Color.fromARGB(255, 30, 30, 30);
  final Color blackCloProBlack = const Color.fromARGB(256, 18, 18, 18);
  final Color grayblackProblack = const Color.fromARGB(256, 52, 52, 52);
  final Color redProblack = const Color.fromARGB(256, 255, 49, 49);
  Size appSize(BuildContext context) => MediaQuery.of(context).size;
  TextStyle textStyle(size) => GoogleFonts.italiana(
      textStyle: TextStyle(fontSize: size, color: whitecloProBlack
          // Additional styling options
          ));
}
