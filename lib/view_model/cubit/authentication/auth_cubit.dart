import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/pages/tickets/my_tickets.dart';
import '../../../view/pages/home/home.dart';
import '../../../view/pages/home/home_layout.dart';
import '../../../view/pages/search/search.dart';
import '../../database/local/shared_preference/cache_helper.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';
import '../../models/auth/data_user.dart';
import 'auth_states.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(LoginInitial());

  static AuthenticationCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
      required String password,
      context}) async {
    emit(SignupLoadingState());
    await DioHelper.postData(
            url: registerEndPoint,
            data: {"name": userName, "email": email, "password": password})
        .then((value) {
      signupResponse = UserData.fromJson(value.data);
      CacheHelper.saveData(
          key: "accessToken", value: signupResponse.accessToken);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeLayout(),
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeLayout(),
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

  GoogleSignIn googleSignIn = GoogleSignIn();

  //GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  Future googleLogin() async {
    emit(LoginLoadingState());
    final googleUser = await googleSignIn.signIn();
    if (googleSignIn == null) {
      emit(LoginErrorState(message: "something went wrong.."));
      return;
    }
    _user = googleUser;
    final googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    UserData? googleAuthResponse;
    DioHelper.postData(
      url: googleEndPoint,
      data: {
        "id": _user!.id,
        "email": _user!.email,
        "firstName": _user!.displayName!.split(' ')[0],
        "lastName": _user!.displayName!.split(' ')[1],
        "picture": _user!.photoUrl,
      },
    ).then((value) {
      googleAuthResponse = UserData.fromJson(value.data);
      CacheHelper.saveData(
          key: "accessToken", value: googleAuthResponse!.accessToken);
      CacheHelper.saveData(key: "userId", value: googleAuthResponse!.data!.id);

      emit(LoginSuccessfulState());
    });
  }
}