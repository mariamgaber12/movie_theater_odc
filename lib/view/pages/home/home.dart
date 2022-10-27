import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_movie_theater/res/colors.dart';
import '../../../cubit/home/home_cubit.dart';
import '../../componentes/home/home_com.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;

  final dates = [
    'April 1 2023',
    'May 2 2023',
    'June 6 2023',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          'assets/img.png',
          width: 65,
          height: 54,
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => HomeCubit()
          ..getAllMovies()
          ..getAllComingMovies(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            var movieCubit = HomeCubit.get(context);
            //var url = movieCubit.movies[0].imageUrl!;
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image:
                    //NetworkImage(movieCubit.movies[0].imageUrl!),
                    AssetImage('assets/card.png')
                    ,fit: BoxFit.cover,
                    opacity: .35),
              ),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Now Playing',
                        style: GoogleFonts.salsa(
                            color: Colors.white,
                            fontSize: 33,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Book your ticket now',
                        style: GoogleFonts.salsa(
                            color: mainColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                  Column(
                    children: [
                      movieCubit.movies.isEmpty
                          ? CircularProgressIndicator(
                              color: mainColor,
                            )
                          : CurvedCarousel(
                              scaleMiddleItem: true,
                              horizontalPadding: 99,
                              curveScale: -20,
                              middleItemScaleRatio: 1.3,
                              viewPortSize: .001,
                              onChangeStart: (index, reason) => setState(
                                () => activeIndex = index,
                              ),
                        itemBuilder: (_, index) {
                                return buildCardMovie(
                                    image: movieCubit.movies[index].imageUrl,
                                    index: index,
                                    name: movieCubit.movies[index].name);
                              },
                              itemCount: movieCubit.movies.length,
                            ),
                      const SizedBox(
                        height: 40,
                      ),
                      buildIndicator(activeIndex: activeIndex),
                    ],
                  ),
                  const SizedBox(
                    height: 59.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 29, bottom: 2),
                    child: Text(
                      'Coming Soon',
                      style: GoogleFonts.roboto(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  BlocConsumer<HomeCubit, HomeState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      var comingMovieCubit = HomeCubit.get(context);
                      return comingMovieCubit.comingMovies.isEmpty
                          ? CircularProgressIndicator(
                              color: mainColor,
                            )
                          : Container(
                              height: 200,
                              child: CarouselSlider.builder(
                                itemCount: comingMovieCubit.comingMovies.length,
                                itemBuilder: (context, index, realIndex) {
                                  return buildComingMovie(
                                    image: comingMovieCubit
                                        .comingMovies[index].imageUrl,
                                    index: index,
                                    date: dates[index],
                                    name: comingMovieCubit
                                        .comingMovies[index].name,
                                  );
                                },
                                options: CarouselOptions(
                                  height: 200,
                                  viewportFraction: .78,
                                  //onPageChanged: (index, reason) => setState(() => activeIndex1 = index,),
                                ),
                              ),
                            );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      drawer: buildDrawerScreen(),
    );
  }
}
