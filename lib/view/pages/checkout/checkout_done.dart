import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/componentes/auth/components.dart';
import 'package:odc_movie_theater/view/pages/home/home_layout.dart';
import 'package:odc_movie_theater/view/pages/tickets/view_ticket.dart';
import '../../componentes/checkout/checkout_com.dart';

class CheckoutDone extends StatelessWidget {
  const CheckoutDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Checkout',
          style: GoogleFonts.roboto(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          DottedLine(
            lineLength: double.infinity,
            dashLength: 410,
            dashColor: mainColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 74, bottom: 24),
            child: Text(
              'Congrats',
              style: GoogleFonts.salsa(
                  fontSize: 42,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
          Text(
            'Reservation Completed',
            style: GoogleFonts.salsa(
                fontSize: 19, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 19,
              right: 83,
              left: 83
            ),
            child: Image.asset('assets/check.png',
              height: 270,
              width: 190,),
          ),
          buildCheckoutButton(
              name: 'View Ticket',
              onPress: () {
                navigateTo(context, const ViewTicket());
              }),
          buildCheckOutlineButton(
              name: 'Back to home',
              onPress: () {
                navigateTo(context, const HomeLayout());
              })
        ],
      ),
    );
  }
}
