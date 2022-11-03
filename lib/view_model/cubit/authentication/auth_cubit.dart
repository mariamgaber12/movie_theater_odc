import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/pages/tickets/my_tickets.dart';
import '../../../res/consts.dart';
import '../../../view/pages/home/home.dart';
import '../../../view/pages/home/home_layout.dart';
import '../../../view/pages/search/search.dart';
import '../../database/local/shared_preference/cache_helper.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';
import '../../models/data_user.dart';
import 'auth_states.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(LoginInitial());
  static AuthenticationCubit get(context) => BlocProvider.of(context);

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

  bool passwordVisibleL = false;
  bool passwordVisibleS1 = false;
  bool passwordVisibleS2 = false;

  void changePassVisibilityLogin(){
     passwordVisibleL = !passwordVisibleL;
     emit(ChangePasswordVisibility());
  }

  void changePassVisibilitySignup(){
    passwordVisibleS1 = !passwordVisibleS1;
    emit(ChangePasswordVisibility());
  }

  void changePassVisibilityConfSignup(){
    passwordVisibleS2 = !passwordVisibleS2;
    emit(ChangePasswordVisibility());
  }

  UserData signupResponse=UserData();
  Future<void> signup(
      {required String userName,
        required String email,
        required String password,context}) async{
    emit(SignupLoadingState());
    DioHelper.postData(url: registerEndPoint, data: {
      "firstName": userName,
      "email": email,
      "password": password
    }).then((value) {
      signupResponse = UserData.fromJson(value.data);
      CacheHelper.saveData(
          key: "accessToken", value: signupResponse.accessToken);
      CacheHelper.saveData(
          key: "userId", value: signupResponse.data!.id);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeLayout(),
        ),
      );

      emit(SignupSuccessfulState());
    }).catchError((error) {
      if (error is DioError) {
        emit(SignupErrorState(
            message: error.response!.data["message"].toString()));
      }
    });
  }


  UserData loginResponse=UserData();
  Future<void> login(
      {required  email,
      required  password,
      required context}) async {
    emit(LoginLoadingState());
    var data = {"email": email, "password": password};
    await DioHelper.postData(
      url: loginEndPoint,
      data: data,
    ).then((value) {
      loginResponse = UserData.fromJson(value.data);
      CacheHelper.saveData(key: "accessToken", value: loginResponse.accessToken);
      CacheHelper.saveData(key: "userId", value: loginResponse.data!.id!);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeLayout() as Widget,
        ),
      );
      showTopSnackBar(
        context,
        const CustomSnackBar.info(
          backgroundColor: Colors.green,
          message: "Welcome back",
        ),
      );
      emit(LoginSuccessfulState());
    }).catchError((error) {
      if (error is DioError) {
        showTopSnackBar(
          context,
          CustomSnackBar.info(
            backgroundColor: mainColor,
            icon: const Icon(Icons.question_mark_outlined),
            message: "Email or Password is not correct",
          ),
        );
        emit(LoginErrorState(
            message: error.response!.data["message"].toString()));
      }
    });
  }

}
