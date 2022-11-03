import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_movie_theater/view/pages/search/search.dart';
import '../../../view/pages/home/home.dart';
import '../../../view/pages/tickets/my_tickets.dart';
import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);

  List<Widget> homeScreens = [
    const Home(),
    const MyTickets(),
    const Search(),
  ];


  int currentNavBarItem = 0;
  void changeCurrentNavBarItem(int index) {
    currentNavBarItem = index;
    if (index == 0) {
      const Home();
    }
    if (index == 1) {
      const MyTickets();
    }
    if (index == 2) {
      const Search();
    }
    emit(ChangeBottomNavBar());
  }
}
