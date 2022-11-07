import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_movie_theater/view_model/models/movies/coming_movies.dart';
import 'package:odc_movie_theater/view_model/models/movies/movies.dart';
import '../../database/local/shared_preference/cache_keys.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);


  int activeIndex = 0;
  int changeActiveIndicator(int index){
    activeIndex=index;
    return activeIndex;
  }

  List<Movies> movies = [];
  void getAllMovies() {
    movies.clear();
    emit(GetAllMoviesLoadingState());
    DioHelper.getData(
      url: moviesEndPoint,
      token: CacheKeysManger.getUserTokenFromCache(),
    ).then((value) {
      print('hell00000o here ${value.data}');
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
      token: CacheKeysManger.getUserTokenFromCache(),
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
        print('hello00000000000');
        searchedMovies.add(element);
      }
    }
    emit(SearchSuccessState());
  }
}
//&Gaber+Nana+2022&