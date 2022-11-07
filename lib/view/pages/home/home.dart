import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_carousel/curved_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/pages/checkout/movie_details.dart';
import '../../../view_model/cubit/home/home_cubit.dart';
import '../../components/auth/components.dart';
import '../../components/home/home_com.dart';
import '../../components/home/home_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dates = [
      'April 1 2023',
      'May 2 2023',
      'June 6 2023',
      'April 1 2023',
      'May 2 2023',
      'June 6 2023',
      'April 1 2023',
      'May 2 2023',
      'June 6 2023',
      'April 1 2023',
      'May 2 2023',
      'June 6 2023',
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
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
                    image: AssetImage('assets/card.png'),
                    fit: BoxFit.cover,
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
                        style: textStyleSalsa.copyWith(
                            fontSize: 33, fontWeight: FontWeight.w400),
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
                        style: textStyleSalsa.copyWith(
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
                      movieCubit.comingMovies.isEmpty
                          ? CircularProgressIndicator(
                              color: mainColor,
                            )
                          : CurvedCarousel(
                        scaleMiddleItem: true,
                              horizontalPadding: 55,
                              curveScale: -20,
                              animationDuration: 55,
                              middleItemScaleRatio: 1.25,
                              viewPortSize: .78,
                              onChangeStart: (index, reason) =>
                                  movieCubit.changeActiveIndicator(index),
                              itemBuilder: (_, index) {
                                return buildCardMovie(
                                    onTap: () {
                                      navigateTo(
                                          context,
                                          MovieDetails(
                                            duration: movieCubit
                                                .comingMovies[index].duration!,
                                            movieId: index,
                                            name: movieCubit
                                                .comingMovies[index].name!,
                                            overview: movieCubit
                                                .comingMovies[index].overview!,
                                            rating: movieCubit
                                                .comingMovies[index].rating!,
                                            image: movieCubit
                                                .comingMovies[index].imageUrl!,
                                            genre: movieCubit
                                                .comingMovies[index].genre!,
                                          ));
                                    },
                                    image:
                                        movieCubit.comingMovies[index].imageUrl,
                                    index: index,
                                    name: movieCubit.comingMovies[index].name);
                              },
                              itemCount: movieCubit.comingMovies.length,
                            ),
                      const SizedBox(
                        height: 40,
                      ),
                      buildIndicator(activeIndex: movieCubit.activeIndex),
                    ],
                  ),
                  const SizedBox(
                    height: 59.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 29, bottom: 2),
                    child: Text(
                      'Coming Soon',
                      style: textStyleRoboto.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
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
                          : SizedBox(
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
      drawer: const DrawerScreen(),
    );
  }
}
