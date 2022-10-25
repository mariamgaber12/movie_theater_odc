import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../res/colors.dart';

Widget buildDrawerScreen ({required icon,required title}) {
  return ListTile(
    leading: Icon(
      icon,
      color: mainColor,
    ),
    title: Text(
      '$title',
      style: GoogleFonts.roboto(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400),
    ),
  );
}