import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Style {

  Style._();

  static const primaryColor = Color(0xff26AD71);
  static const greyColor = Color(0xff777777);
  static const white = Colors.white;
  static const black = Colors.black;
  static const bgCategory = Color(0xffF3E9DD);
  static const red = Colors.red;
  static const bgProduct = Color(0xffF1F4F3);
  static const DarkTextColor = Color(0xff194B38);
  static const transparent = Colors.transparent;
  static Color shimmerBase = Colors.grey.shade300;




  // ------------------ text -----------------//

  static textStyleNormal({double size = 16, Color textColor = primaryColor}) {
    return GoogleFonts.raleway(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
    );
  }

  static textStyleSemiBold({double size = 16, Color textColor = primaryColor}) {
    return GoogleFonts.raleway(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    );
  }

  static textStyleBold({double size = 18, Color textColor = primaryColor}) {
    return GoogleFonts.raleway(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.none,
    );
  }

  static textStyleRegular({double size = 16, Color textColor = primaryColor}) {
    return GoogleFonts.raleway(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none,
    );
  }

  static textStyleThin({double size = 16, Color textColor = primaryColor}) {
    return GoogleFonts.raleway(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.w300,
      decoration: TextDecoration.none,
    );
  }

  static textStylePrice({double size = 20, Color textColor = primaryColor}) {
    return GoogleFonts.montserrat(
      fontSize: size,
      color: textColor,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    );
  }

}