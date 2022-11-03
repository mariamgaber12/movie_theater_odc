import 'package:curved_carousel/curved_carousel.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/pages/checkout/checkout_pay.dart';

import '../../components/auth/components.dart';
import '../../components/checkout/checkout_com.dart';

class Reservation extends StatelessWidget {
  const Reservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> timeList=['6:30pm','9:00pm','11:30am','6:30pm','9:00pm','11:30am','6:30pm','9:00pm','11:30am','6:30pm','9:00pm','11:30am'];

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
            const SizedBox(
              height: 23,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Spiderman No Way Home',
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            CurvedCarousel(
              scaleMiddleItem: true,
              horizontalPadding: 30,
              curveScale: -14,
              middleItemScaleRatio: 1,
              viewPortSize: .2,
              itemBuilder: (_, index) {
                return buildMovieTime(time: timeList[index]);
              },
              itemCount: timeList.length,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('.',
                  style: GoogleFonts.roboto(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: mainColor),
                ),
              ],
            ),
            const SizedBox(height: 15,),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DottedLine(
                    lineThickness: 4,
                    lineLength: 300,
                    dashLength: 300,
                    dashColor: mainColor,
                    dashRadius: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50,),

            //theater seats
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.accessible_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.accessible_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.accessible_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.accessible_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.accessible_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.accessible_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.accessible_outlined, onPress: (){},color: Colors.white24),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){},color: Colors.white24),
              ],
            ),

            const SizedBox(height: 35,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){}, color: Colors.white24),
                Text('Reserved', style: GoogleFonts.roboto(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),),
                const SizedBox(width: 10,),
                buildSeatIcon(seatIcon: Icons.event_seat_outlined, onPress: (){}, color: mainColor),
                Text('Available', style: GoogleFonts.roboto(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),),
                const SizedBox(width: 10,),
                buildSeatIcon(seatIcon: Icons.event_seat_rounded, onPress: (){},color: mainColor),
                Text('Selected', style: GoogleFonts.roboto(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                ),

              ],
            ),

            const SizedBox(height: 45,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Icon(Icons.money,color: Colors.white,size: 24,),
                const SizedBox(width: 10,),
                Text('150 EGP', style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),),
                const SizedBox(width: 35,),
                Text('.', style: GoogleFonts.roboto(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),),
                const SizedBox(width: 35,),
                Text('4 Seats Selected', style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),),
              ],
            ),

            const SizedBox(height: 15,),

          ],
        ),
        bottomNavigationBar: buildBottomNav(
            onTap: () {
              navigateTo(context, const CheckoutPay());
            },
            name: 'Checkout'));
  }
}