import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../res/colors.dart';

Widget buildButton({required name, required onPress}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, left: 45, right: 45,bottom: 15),
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
            style:  GoogleFonts.roboto(
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

Widget buildOutlineButton({required name, required onPress}) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, left: 45, right: 45,bottom: 15),
    child: GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2.2,color: mainColor),
            color: Colors.white),
        child: Center(
          child: Text(
            name,
            style: textstyle.copyWith(color: mainColor),
          ),
        ),
      ),
    ),
  );
}

Widget myDriver() => Padding(
  padding: const EdgeInsets.only(left: 20, right: 25,),
  child: Divider(
    color: Colors.grey[400]!,
  ),
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

TextStyle textstyle = GoogleFonts.salsa(
  fontSize: 38,
  fontWeight: FontWeight.w400,
  color: Colors.white,
);

Widget myLine(
    {double left = 5,
      double? right = 5,
      required double width,
      double top = 2.0}) =>
    Padding(
      padding: EdgeInsets.only(
          left: left = 5, right: right = 5, top: 20, bottom: 15),
      child: Container(
        height: 1,
        width: width,
        color: Colors.grey,
      ),
    );

Widget defaultTaskFormField({
  required TextEditingController controller,
  //required validate,
  required String hint,
  required type,
  bool obscure=false,
  Widget? suffixIcon,
}) =>
    Padding(
      padding: const EdgeInsets.only(top: 10, left: 45, right: 45),
      child: Container(
        width: double.infinity,
        height: 66,
        child: TextFormField(
          controller: controller,
          autofocus: false,
          obscureText: obscure,
          keyboardType: type,
          textInputAction: TextInputAction.next,
          //validator: validate,
          style:  GoogleFonts.salsa(
            fontWeight: FontWeight.w600,
            color: Colors.white54,
          ),
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: suffixIcon,
            hintStyle:
            GoogleFonts.salsa(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white54,
            ),
            filled: true,
            fillColor: Colors.white24,
            enabledBorder: OutlineInputBorder(
               // borderSide: BorderSide(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide:   BorderSide(color: mainColor),
                borderRadius: BorderRadius.circular(15)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
    );
