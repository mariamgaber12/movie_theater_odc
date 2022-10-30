import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/componentes/auth/components.dart';
import 'package:odc_movie_theater/view/pages/checkout/checkout_pay.dart';
import 'package:odc_movie_theater/view/pages/checkout/reservation.dart';

import '../../componentes/checkout/checkout_com.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  bool  isColor= false;

  @override
  void initState() {
    isColor= false;
  }

  @override
  Widget build(BuildContext context) {

    List<int> day=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];

    return Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/coming.png'),
                    const Positioned(
                        top: 90,
                        right: 140,
                        left: 140,
                        child: Icon(
                          Icons.play_arrow_rounded,
                          size: 55,
                          color: Colors.white,
                        )),
                    const Positioned(
                        top: 20,
                        left: 10,
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        )),
                  ],
                ),
                Positioned(
                  top: 170,
                  left: 80,
                  child: Row(
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
                ),
                Positioned(
                  top: 190,
                  left: 85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'PG-13',
                        style: GoogleFonts.roboto(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '.',
                        style: GoogleFonts.roboto(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.red),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '2h 28m',
                        style: GoogleFonts.roboto(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '.',
                        style: GoogleFonts.roboto(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.red),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Action | Adventure',
                        style: GoogleFonts.roboto(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_rounded,
                  color: mainColor,
                ),
                Icon(
                  Icons.star_rounded,
                  color: mainColor,
                ),
                Icon(
                  Icons.star_rounded,
                  color: mainColor,
                ),
                Icon(
                  Icons.star_rounded,
                  color: mainColor,
                ),
                Icon(
                  Icons.star_half_rounded,
                  color: mainColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  '8.7',
                  style: GoogleFonts.roboto(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                Text(
                  'Synopsis',
                  style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 35,
                ),
                Text(
                  "Peter Parker's secret identity is revealed to the entire \n"
                  "world desperate for help, peter turns to doctor \n"
                  "strange to make the world forget that he is Spider-Man.\n",
                  maxLines: 5,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.roboto(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                Text(
                  'Cast & Crew',
                  style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          'See All',
                          style: GoogleFonts.roboto(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.double_arrow,
                          size: 13,
                          color: mainColor,
                        ),
                      ],
                    )),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                buildMovieCast(),
                buildMovieCast(),
                buildMovieCast(),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                Text(
                  'Select Date',
                  style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),

            CarouselSlider.builder(
              itemCount: 28,
              itemBuilder: (context, index, realIndex) {
                return buildDateCard(
                  color: isColor==true? mainColor:Colors.white10,
                  day: day[index],
                  onTap: (){
                    setState(() =>
                    isColor = ! isColor );
                  },
                );
              },
              options: CarouselOptions(
                enableInfiniteScroll: false,
                //reverse: false,
                //pageSnapping: false,
                height: 100,
                pauseAutoPlayInFiniteScroll: true,
                viewportFraction: .19,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

          ],
        ),
        bottomNavigationBar: buildBottomNav(
            onTap: () {
              navigateTo(context, const Reservation());
            },
            name: 'Reservation'));
  }
}
