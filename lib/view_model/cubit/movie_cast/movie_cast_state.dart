part of 'movie_cast_cubit.dart';

@immutable
abstract class MovieCastState {}

class MovieCastInitial extends MovieCastState {}

class GetAllMovieCastLoadingState extends MovieCastState {}
class GetAllMovieCastSuccessfulState extends MovieCastState {}
class GetAllMovieCastErrorState extends MovieCastState {}
