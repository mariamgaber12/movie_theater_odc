import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_movie_theater/res/colors.dart';

Widget buildCheckoutButton({required name, required onPress}) {
  return Padding(
    padding: const EdgeInsets.only(top: 49, left: 54, right: 54, bottom: 48),
    child: GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: mainColor,
        ),
        child: Center(
          child: Text(
            name,
            style: GoogleFonts.roboto(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildCheckOutlineButton({required name, required onPress}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 54,
      right: 54,
    ),
    child: GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2.2, color: mainColor),
            color: Colors.transparent),
        child: Center(
          child: Text(
            name,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget payFormField({
  required TextEditingController controller,
  //required validate,
  required String hint,
  required type,
  required double width,
  bool obscure=false,
  double top = 1,
  double bottom=1,
  double right=1,
  double left=1,
}) =>
    Padding(
      padding:
           EdgeInsets.only(top:top, left: left, right: right,bottom: bottom),
      child: Container(
        width: width,
        height: 43,
        child: Center(
          child: TextFormField(
            controller: controller,
            autofocus: false,
            keyboardType: type,
            obscureText: obscure,
            textInputAction: TextInputAction.next,
            style: GoogleFonts.salsa(
              fontWeight: FontWeight.w600,
              color: Colors.white54,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.roboto(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.white54,
              ),
              filled: true,
              fillColor: Colors.grey.shade900,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
      ),
    );

Widget buildCheckDropdown(
    {required list, required onChange, required dropdownValue}) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Colors.grey.shade900,
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10)),
    child: DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.white70,
      ),
      elevation: 16,
      style: TextStyle(color: mainColor),
      underline: Container(
        height: 0.001,
        color: Colors.transparent,
      ),
      onChanged: onChange,
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: GoogleFonts.roboto(
                color: Colors.white10,
                fontWeight: FontWeight.w700,
                fontSize: 16),
          ),
        );
      }).toList(),
    ),
  );
}
