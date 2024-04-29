import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static  TextStyle interW700size32 = GoogleFonts.inter(
    textStyle:  const TextStyle(color: Colors.white, fontSize:32, fontWeight: FontWeight.w700),
  );
  static  TextStyle interW400size12 = GoogleFonts.inter(
    textStyle:  const TextStyle(color: Colors.white, fontSize:12 ,fontWeight: FontWeight.w400),
  );

  static  TextStyle interW300size122 = GoogleFonts.inter(
    textStyle:  const TextStyle(color: Colors.white, fontSize:122 ,fontWeight: FontWeight.w300),
  );
  static const  TextStyle circularW300size122 = TextStyle(color: Colors.white, fontSize:122 , fontFamily: "Circular Std");
  static const  TextStyle circularW400size18 = TextStyle(color: Colors.white, fontSize:18 , fontFamily: "Circular Std");
  static const  TextStyle circularW400size16 = TextStyle(color: Colors.white, fontSize:16 , fontFamily: "Circular Std");
  static const  TextStyle circularW500size16 = TextStyle(color: Colors.white30, fontSize:16 , fontFamily: "Circular Std");
  static const  TextStyle circularW400size24 = TextStyle(color: Colors.white, fontSize:24 , fontFamily: "Circular Std");
  static const  TextStyle circularW500size24 = TextStyle(color: Colors.white30, fontSize:24 , fontFamily: "Circular Std");
}