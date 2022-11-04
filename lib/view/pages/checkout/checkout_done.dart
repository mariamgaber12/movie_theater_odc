import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/pages/home/home_layout.dart';
import 'package:odc_movie_theater/view/pages/tickets/view_ticket.dart';
import '../../components/auth/components.dart';
import '../../components/checkout/checkout_com.dart';

class CheckoutDone extends StatelessWidget {
  const CheckoutDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        title: Text(
          'Checkout',
          style: textStyleRoboto.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
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
              style: textStyleSalsa.copyWith(
                fontSize: 42,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            'Reservation Completed',
            style: textStyleSalsa.copyWith(
              fontSize: 19,
              fontWeight: FontWeight.w400,
            ),
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
