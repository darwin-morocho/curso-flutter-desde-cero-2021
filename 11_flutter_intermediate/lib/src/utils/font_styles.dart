import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FontStyles {
  static final TextTheme textTheme = GoogleFonts.nunitoTextTheme();

  static final title = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final regular = GoogleFonts.nunito(
    fontWeight: FontWeight.w600,
  );

  static final normal = GoogleFonts.nunito(
    fontWeight: FontWeight.w300,
  );
}
