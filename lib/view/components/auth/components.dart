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
            style:
            textStyleRoboto.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: secondColor,
            ),
          ),
        ),
      ),
    ),
  );
}


void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

TextStyle textStyleSalsa = GoogleFonts.salsa(
  color: secondColor,
);

TextStyle textStyleRoboto = GoogleFonts.roboto(
  color: secondColor,
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
        color: Colors.white60,
      ),
    );

Widget defaultTaskFormField({
  required TextEditingController controller,
  required validate,
  required String hint,
  required type,
  bool obscure=false,
  Widget? suffixIcon,
}) =>
    Padding(
      padding: const EdgeInsets.only(top: 10, left: 45, right: 45),
      child: SizedBox(
        width: double.infinity,
        height: 66,
        child: TextFormField(
          controller: controller,
          autofocus: false,
          obscureText: obscure,
          keyboardType: type,
          textInputAction: TextInputAction.next,
          validator: validate,
          style:  textStyleSalsa.copyWith(
            fontWeight: FontWeight.w600,
            color: fourthColor,
          ),
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: suffixIcon,
            hintStyle: textStyleSalsa.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: fourthColor,),
            filled: true,
            fillColor: thirdColor,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide:   BorderSide(color: mainColor),
                borderRadius: BorderRadius.circular(15)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
    );