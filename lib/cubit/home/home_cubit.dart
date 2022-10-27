import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc_movie_theater/view_model/models/coming_movies.dart';
import 'package:odc_movie_theater/view_model/models/movies.dart';
import 'package:odc_movie_theater/view_model/network/end_points.dart';
import '../../res/consts.dart';
import '../../view_model/network/dio_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);


  List<Movies> movies = [];
  void getAllMovies() {
    movies.clear();
    emit(GetAllMoviesLoadingState());
    DioHelper.getData(
        url: moviesEndPoint,
        token : accessToken,
    ).then((value) {
      print(value.statusCode);
      for (var element in value.data) {
        movies.add(Movies.fromJson(element));
      }
      emit(GetAllMoviesSuccessfulState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetAllMoviesErrorState());
    });
  }


  List<ComingMovies> comingMovies = [];
  void getAllComingMovies() {
    comingMovies.clear();
    emit(GetAllComingMoviesLoadingState());
    DioHelper.getData(
      url: comingMoviesEndPoint,
      token : accessToken,
    ).then((value) {
      print(value.statusCode);
      for (var element in value.data) {
        comingMovies.add(ComingMovies.fromJson(element));
      }
      print(comingMovies[0].name);
      emit(GetAllComingMoviesSuccessfulState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetAllComingMoviesErrorState());
    });
  }


  List<Movies> searchedMovies = [];
  void searchMovies(String word) {
    searchedMovies.clear();
    emit(SearchLoadingState());
    for (var element in movies) {
      if (element.name!.contains(word)) {
        searchedMovies.add(element);
      }
    }
    emit(SearchSuccessState());
  }
}
