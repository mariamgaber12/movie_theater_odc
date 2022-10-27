import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/pages/search/search.dart';
import '../../view/pages/home/home.dart';
import '../../view/pages/tickets/my_tickets.dart';
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
  bool selectColor0=false;
  bool selectColor1=false;
  bool selectColor2=false;

  void changeCurrentNavBarItem(int index) {
    if (index == 0) {
      const Home();
      selectColor0 = !selectColor0;
    }
    if (index == 1) {
      const MyTickets();
      selectColor1 = !selectColor1;
    }
    if (index == 2) {
      const Search();
      selectColor2 = !selectColor2;
    }

    currentNavBarItem = index;
    emit(ChangeBottomNavBar());
  }

  bool passwordVisible1 = false;
  bool passwordVisible2 = false;
  void changeVisiblePassword1() {
    passwordVisible1 = !passwordVisible1;
    emit(ChangeVisiblePassword());
  }

  void changeVisiblePassword2() {
    passwordVisible2 = !passwordVisible2;
    emit(ChangeVisiblePassword());
  }
}
