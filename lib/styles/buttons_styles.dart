// lib/src/styles.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Text Styles
TextStyle titleTextStyle({required double fontSize}) {
  return GoogleFonts.bebasNeue(
    fontSize: fontSize,
    color: Colors.white,
  );
}

const TextStyle buttonTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.white,
);

// Button Styles
ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: Colors.transparent, // Remove the default button color
  shadowColor: Colors.transparent, // Remove the button shadow
  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
);
