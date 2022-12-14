import 'package:curved_carousel/curved_carousel.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/pages/checkout/checkout_pay.dart';
import '../../components/auth/components.dart';
import '../../components/checkout/checkout_com.dart';

class Reservation extends StatefulWidget {
  const Reservation({Key? key}) : super(key: key);

  @override
  State<Reservation> createState() => _ReservationState();
}

bool selected = false;

class _ReservationState extends State<Reservation> {
  @override
  Widget build(BuildContext context) {
    List<String> timeList = [
      '6:30pm',
      '9:00pm',
      '12:30am',
      '6:30pm',
      '9:00pm',
      '12:30am',
      '6:30pm',
      '9:00pm',
      '12:30am',
      '6:30pm',
      '9:00pm',
      '12:30am'
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: firstColor,
          title: Text('Reservation',
              style: textStyleRoboto.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              )),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DottedLine(
                    lineLength: 170,
                    dashLength: 170,
                    dashColor: mainColor,
                  ),
                ],
              ),
              const SizedBox(
                height: 23,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Spiderman No Way Home',
                      style: textStyleRoboto.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              CurvedCarousel(
                scaleMiddleItem: true,
                horizontalPadding: 25,
                curveScale: -15,
                middleItemScaleRatio: 1,
                animationDuration: 100,
                viewPortSize: .2,
                itemBuilder: (_, index) {
                  return buildMovieTime(time: timeList[index]);
                },
                itemCount: timeList.length,
              ),

              const SizedBox(
                height: 15,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.fiber_manual_record, color: mainColor, size: 15),
                ],
              ),
              const SizedBox(
                height: 15,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/curve.png',
                    width: 340,
                    height: 120,
                    fit: BoxFit.fitWidth,
                  )
                ],
              ),

              //theater seats
/*
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.accessible_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.accessible_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.accessible_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.accessible_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.accessible_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.accessible_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.accessible_outlined,
                          onPress: () {},
                          color: thirdColor),
                      buildSeatIcon(
                          seatIcon: Icons.event_seat_outlined,
                          onPress: () {},
                          color: thirdColor),
                    ],
                  ),
                ],
              ),

 */
              Center(
                child: Positioned(
                  child: Container(
                    padding: const EdgeInsets.only(top: 80, left: 15),
                    width: MediaQuery.of(context).size.width * .9,
                    height: MediaQuery.of(context).size.height * .5,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        //crossAxisSpacing: 5,
                        //mainAxisSpacing: 5,
                        // mainAxisExtent: 150
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                            onTap: () {
                              setState(() {
                                selected = !selected;
                              });
                            },
                            child: selected
                                ? Icon(
                                    Icons.event_seat,
                                    color: mainColor,
                                  )
                                : Icon(
                                    Icons.event_seat_outlined,
                                    color: thirdColor,
                                  ));
                      },
                      itemCount: 36,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildSeatIcon(
                      seatIcon: Icons.event_seat_outlined,
                      onPress: () {},
                      color: thirdColor),
                  Text(
                    'Reserved',
                    style: textStyleRoboto.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  buildSeatIcon(
                      seatIcon: Icons.event_seat_outlined,
                      onPress: () {},
                      color: mainColor),
                  Text(
                    'Available',
                    style: textStyleRoboto.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  buildSeatIcon(
                      seatIcon: Icons.event_seat_rounded,
                      onPress: () {},
                      color: mainColor),
                  Text(
                    'Selected',
                    style: textStyleRoboto.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.money,
                    color: secondColor,
                    size: 24,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '150 EGP',
                    style: textStyleRoboto.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  Text(
                    '.',
                    style: textStyleRoboto.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  Text(
                    '4 Seats Selected',
                    style: textStyleRoboto.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
        bottomNavigationBar: buildBottomNav(
            onTap: () {
              navigateTo(context, const CheckoutPay());
            },
            name: 'Checkout'));
  }
}
