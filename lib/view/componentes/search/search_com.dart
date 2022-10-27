import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../res/colors.dart';

Widget buildSearchFormField({
  required TextEditingController controller,
  required String hint,
  required  onChange,
}) =>
    Padding(
      padding: const EdgeInsets.only(top: 25, left: 30, right: 30),
      child: Container(
        width: double.infinity,
        height: 48,
        child: TextFormField(
          onChanged: onChange,
          controller: controller,
          autofocus: false,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          style: GoogleFonts.salsa(
            fontWeight: FontWeight.w600,
            color: Colors.white54,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.salsa(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white54,
            ),
            filled: true,
            fillColor: Colors.white24,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(41)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: mainColor),
                borderRadius: BorderRadius.circular(41)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(41)),
          ),
        ),
      ),
    );
