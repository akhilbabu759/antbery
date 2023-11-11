import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStryle {
  final Color bluMin = const Color.fromARGB(255, 64, 111, 166);
  final Color whiteCle = const Color.fromARGB(255, 248, 248, 248);
  TextStyle textStyle(size) => GoogleFonts.italiana(
      textStyle: TextStyle(fontSize: size, color: AppStryle().whiteCle
          // Additional styling options
          ));
}
