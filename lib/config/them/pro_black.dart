import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProBlackStyle{
  final Color whitecloProBlack = Color.fromARGB(255, 255, 255, 255);
  final Color lightBlackcloProBlack = Color.fromARGB(255, 30, 30, 30);
  final Color blackCloProBlack = Color.fromARGB(255, 18, 18, 18);
  final Color grayblackProblack = Color.fromARGB(255, 52, 52, 52);
  final Color redProblack = Color.fromARGB(255, 255, 49, 49);
  final Color graywhiteProBlack=Color.fromARGB(255, 130, 130, 130);
  Size bappSize(BuildContext context) => MediaQuery.of(context).size;
  TextStyle btextStyle(size) => GoogleFonts.italiana(
      textStyle: TextStyle(fontSize: size!, color: whitecloProBlack
          // Additional styling options
          ));
}
