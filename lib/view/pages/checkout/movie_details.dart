import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/pages/checkout/reservation.dart';
import 'package:odc_movie_theater/view_model/cubit/movie_cast/movie_cast_cubit.dart';
import '../../components/auth/components.dart';
import '../../components/checkout/checkout_com.dart';

class MovieDetails extends StatefulWidget {
  final int movieId;
  const MovieDetails({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool isColor = false;

  @override
  void initState() {
    isColor = false;
  }

  @override
  Widget build(BuildContext context) {
    List<int> day = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      24,
      25,
      26,
      27,
      28,
      29,
      30,
      31
    ];

    return Scaffold(
        body: ListView(
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/coming.png'),
                     Positioned(
                        top: 90,
                        right: 140,
                        left: 140,
                        child: Icon(
                          Icons.play_arrow_rounded,
                          size: 55,
                          color: secondColor,
                        )),
                    Positioned(
                        top: 20,
                        left: 10,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: secondColor,
                          ),
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
                        style: textStyleRoboto.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
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
                        style: textStyleRoboto.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '.',
                        style: textStyleRoboto.copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: mainColor),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '2h 28m',
                        style: textStyleRoboto.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        '.',
                        style: textStyleRoboto.copyWith(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: mainColor),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Action | Adventure',
                        style: textStyleRoboto.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
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
                  style: textStyleRoboto.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
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
                  style: textStyleRoboto.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
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
                  "world. Desperate for help, Peter turns to Doctor \n"
                  "Strange to make the world forget that he is Spider-Man. \n"
                  "The spell goes horribly wrong and shatters the \n"
                  "multiverse, bringing in monstrous villains that could \n"
                  "destroy the world.",
                  maxLines: 5,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.justify,
                  style: textStyleRoboto.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
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
                  style: textStyleRoboto.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          'See All',
                          style: textStyleRoboto.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
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
            BlocProvider(
              create: (context) =>
                  MovieCastCubit()..getAllMovieCast(id: widget.movieId),
              child: BlocConsumer<MovieCastCubit, MovieCastState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var castCubit = MovieCastCubit.get(context);
                  return castCubit.movieCast.isEmpty
                      ? CircularProgressIndicator(
                          color: mainColor,
                        )
                      : Row(
                          children: [
                            const SizedBox(
                              width: 25,
                            ),
                            ListView.builder(
                              itemBuilder: (BuildContext context, int index) {
                                return buildMovieCast();
                              },
                              itemCount: castCubit.movieCast.length,
                            ),
                          ],
                        );
                },
              ),
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
                  style: textStyleRoboto.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            CarouselSlider.builder(
              itemCount: 28,
              itemBuilder: (context, index, realIndex) {
                return buildDateCard(
                  color: isColor == true ? mainColor : Colors.white10,
                  day: day[index],
                  onTap: () {
                    setState(() => isColor = !isColor);
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
