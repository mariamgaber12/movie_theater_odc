part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetAllMoviesLoadingState extends HomeState {}
class GetAllMoviesSuccessfulState extends HomeState {}
class GetAllMoviesErrorState extends HomeState {}

class GetAllComingMoviesLoadingState extends HomeState {}
class GetAllComingMoviesSuccessfulState extends HomeState {}
class GetAllComingMoviesErrorState extends HomeState {}


class SearchLoadingState extends HomeState {}
class SearchSuccessState extends HomeState {}