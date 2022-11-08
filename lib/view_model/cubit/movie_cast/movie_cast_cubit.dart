import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_movie_theater/view_model/database/network/end_points.dart';
import 'package:odc_movie_theater/view_model/models/movies/movie_cast.dart';
import '../../database/local/shared_preference/cache_keys.dart';
import '../../database/network/dio_helper.dart';
part 'movie_cast_state.dart';

class MovieCastCubit extends Cubit<MovieCastState> {
  MovieCastCubit() : super(MovieCastInitial());

  static MovieCastCubit get(context) => BlocProvider.of(context);

  List<MovieCast> movieCast = [];

  void getAllMovieCast({required id}) async {
    movieCast.clear();
    emit(GetAllMovieCastLoadingState());
    await DioHelper.getData(
      url: 'movies/$id/casts',
      token: CacheKeysManger.getUserTokenFromCache(),
    ).then((value) {
      for (var element in value.data) {
        movieCast.add(MovieCast.fromJson(element));
      }
      print(movieCast.length);
      emit(GetAllMovieCastSuccessfulState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetAllMovieCastErrorState());
    });
  }

}
