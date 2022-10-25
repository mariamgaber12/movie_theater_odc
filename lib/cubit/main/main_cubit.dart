import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_movie_theater/res/colors.dart';
import '../../view/pages/home/home.dart';
import 'main_state.dart';


class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);

  List<Widget> homeScreens = [
    const Home(),
    const Home(),
    const Home(),
  ];


  int currentNavBarItem = 0;
  var color;
  void changeCurrentNavBarItem(int index) {
    if(index==0) {
      const Home();
      color=mainColor;
    }
    if(index==1) {
      const Home();
      color=mainColor;

    }
    if(index==2) {
      const Home();
      color=mainColor;

    }
    currentNavBarItem = index;
    emit(ChangeBottomNavBar());
  }

  bool passwordVisible1 = false;
  bool passwordVisible2 = false;
  void changeVisiblePassword1(){
    passwordVisible1 = !passwordVisible1;
    emit(ChangeVisiblePassword());
  }

  void changeVisiblePassword2(){
    passwordVisible2 = !passwordVisible2;
    emit(ChangeVisiblePassword());
  }



}