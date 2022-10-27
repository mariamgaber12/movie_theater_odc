import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/componentes/auth/components.dart';
import 'package:odc_movie_theater/view/pages/checkout/checkout_done.dart';
import 'package:odc_movie_theater/view/pages/checkout/checkout_pay.dart';

class Reservation extends StatelessWidget {
  const Reservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Reservation',
          style: GoogleFonts.roboto(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          DottedLine(
            lineLength: 180,
            dashLength: 180,
            dashColor: mainColor,
          ),
          const SizedBox(height: 23,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Spiderman No Way Home',
                style: GoogleFonts.roboto(
                    fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: (){
          navigateTo(context, const CheckoutPay());
        },
        child: Container(
          height: 75,
          width: double.infinity,
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: const BorderRadius.only(bottomRight:const Radius.circular(20),bottomLeft:Radius.circular(20) ),
          ),
          child: Center(
            child: TextButton(
              onPressed: (){
                navigateTo(context, const CheckoutPay());
              },
              child: Text(
                'Checkout',
                style: GoogleFonts.roboto(
                    fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
