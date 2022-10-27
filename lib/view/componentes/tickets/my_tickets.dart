import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../res/colors.dart';

Widget buildTicketButton({required name, required onPress}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: GestureDetector(
      onTap: onPress,
      child: Container(
        width: 140,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: mainColor,
        ),
        child: Center(
          child: Text(
            name,
            style: GoogleFonts.roboto(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildTickets(
    {required image,
    required name,
    required date,
    required position,
    required onPressTicket}) {
  return Padding(
    padding: const EdgeInsets.only(left: 35, top: 25, right: 36, bottom: 25),
    child: Container(
      color: Colors.transparent,
      height: 171,
      child: Stack(children: [
        Column(
          children: [
            Container(
              height: 85,
              decoration: const BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
            ),
            Container(
              height: 86,
              decoration: const BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15))),
            ),
          ],
        ),
        Positioned(
          top: 18,
          bottom: 13,
          left: 35,
          right: 30,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: 95,
                  height: 152,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      "$name",
                      style: GoogleFonts.roboto(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "$date",
                          style: GoogleFonts.roboto(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.event_seat_outlined,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "$position",
                          style: GoogleFonts.roboto(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  buildTicketButton(name: 'View Ticket', onPress: onPressTicket)
                ],
              ),
            ],
          ),
        ),
      ]),
    ),
  );
}

Widget buildViewTicket({
  required movie,
  required name,
  required seats,
  required date,
  required time,
  required npOrder,
  required price,

}) {
  return Padding(
    padding: const EdgeInsets.only(top: 122, left: 38, right: 39),
    child: Container(
      height: 500,
      width: double.infinity,
      //color: Colors.transparent,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white12, borderRadius: BorderRadius.circular(15)),
          ),
          Positioned(
            top: 35,
              left: 24,
              right: 38,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Movie: $movie',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),),
              const SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),),
                      const SizedBox(height: 10,),
                      Text(
                        '$name',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),),

                      const SizedBox(height: 25,),

                      Text(
                        'Date',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),),
                      const SizedBox(height: 10,),
                      Text(
                        '$date',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),),

                      const SizedBox(height: 25,),

                      Text(
                        'NP Order',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),),
                      const SizedBox(height: 10,),
                      Text(
                        '$npOrder',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),),

                    ],
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Seats',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),),
                      const SizedBox(height: 10,),
                      Text(
                        '$seats',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),),

                      const SizedBox(height: 25,),

                      Text(
                        'Time',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),),
                      const SizedBox(height: 10,),
                      Text(
                        '$time',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),),

                      const SizedBox(height: 25,),

                      Text(
                        'Price',
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),),
                      const SizedBox(height: 10,),
                      Text(
                        '$price',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),),
                    ],
                  ),

                ],
              ),

            ],
          )),
          Positioned(
              left: -25,
              top: 300,
              child: Container(
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ))),
          Positioned(
              right: -25,
              top: 300,
              child: Container(
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ))),
          const Positioned(
            right: 0,
            top: 320,
            left: 0,
            child: DottedLine(
              dashLength: 8,
              dashColor: Colors.black,
            ),
          ),
          Positioned(
              right: 97,
              top: 350,
              left: 103,
              bottom: 25,
              child: Image.asset('assets/qr_code.png')),
        ],
      ),
    ),
  );
}
