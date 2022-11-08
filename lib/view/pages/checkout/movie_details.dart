import 'dart:core';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/pages/checkout/reservation.dart';
import 'package:odc_movie_theater/view_model/cubit/movie_cast/movie_cast_cubit.dart';
import '../../components/auth/components.dart';
import '../../components/checkout/checkout_com.dart';

class MovieDetails extends StatelessWidget {
  final int movieId;
  final String name;
  final String genre;
  final int duration;
  final String image;
  final String overview;
  final double rating;

  //final runtimeType;

  const MovieDetails({
    Key? key,
    required this.movieId,
    required this.genre,
    required this.duration,
    required this.image,
    required this.overview,
    required this.rating,
    required this.name,
    //required this.runtimeType
  }) : super(key: key);

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
        body: BlocProvider(
          create: (context) => MovieCastCubit()..getAllMovieCast(id: movieId),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 240,
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            image,
                            height: 220,
                            fit: BoxFit.fitWidth,
                            width: double.infinity,
                          ),
                          Positioned(
                              top: 85,
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
                        top: 185,
                        left: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              name,
                              style: textStyleRoboto.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                Icon(Icons.fiber_manual_record,
                                    color: mainColor, size: 12.5),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  formattedTime(timeInSeconds: duration),
                                  style: textStyleRoboto.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Icon(Icons.fiber_manual_record,
                                    color: mainColor, size: 12.5),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  genre,
                                  style: textStyleRoboto.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.readOnly(
                      filledIcon: Icons.star,
                      emptyIcon: Icons.star_border,
                      halfFilledIcon: Icons.star_half,
                      size: 25,
                      filledColor: mainColor,
                      emptyColor: thirdColor,
                      halfFilledColor: mainColor,
                      isHalfAllowed: true,
                      direction: Axis.horizontal,
                      initialRating: (rating / 2),
                      maxRating: 5,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '$rating',
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
                      width: 25,
                    ),
                    Expanded(
                      child: Text(
                        overview,
                        maxLines: 15,
                        overflow: TextOverflow.visible,
                        textAlign: TextAlign.justify,
                        softWrap: true,
                        style: textStyleRoboto.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
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
                BlocConsumer<MovieCastCubit, MovieCastState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var castCubit = MovieCastCubit.get(context);
                    return castCubit.movieCast.isEmpty
                        ? CircularProgressIndicator(
                            color: mainColor,
                          )
                        : CarouselSlider.builder(
                            itemCount: castCubit.movieCast.length,
                            itemBuilder: (context, index, realIndex) {
                              return buildMovieCast(
                                image: castCubit.movieCast[index].imageUrl!,
                                name: castCubit.movieCast[index].actorName!,
                              );
                            },
                            options: CarouselOptions(
                              reverse: true,
                              autoPlayCurve: Curves.easeInOut,
                              enableInfiniteScroll: false,
                              height: 110,
                              viewportFraction: .30,
                            ),
                          );
                  },
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
                      color: Colors.white10,
                      day: day[index],
                      onTap: () {},
                      month: 'November',
                    );
                  },
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    height: 100,
                    pauseAutoPlayInFiniteScroll: true,
                    viewportFraction: .19,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: buildBottomNav(
            onTap: () {
              navigateTo(context, const Reservation());
            },
            name: 'Reservation'));
  }

  formattedTime({required int timeInSeconds}) {
    int min = timeInSeconds % 60;
    int hour = (timeInSeconds / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String hours = hour.toString().length <= 1 ? "0$hour" : "$hour";
    return "${hours}h  ${minute}m";
  }
}
