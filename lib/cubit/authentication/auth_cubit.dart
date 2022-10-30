import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_movie_theater/view/pages/tickets/my_tickets.dart';
import '../../res/consts.dart';
import '../../view/pages/home/home.dart';
import '../../view/pages/home/home_layout.dart';
import '../../view/pages/search/search.dart';
import '../../view_model/models/data_user.dart';
import '../../view_model/network/dio_helper.dart';
import '../../view_model/network/end_points.dart';
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

  UserData datauser = UserData();
  Future<void> signup(
      String name, String email, String password, context) async {
    var data = {"name": name, "email": email, "password": password};
    await DioHelper.postData(
      url: loginEndPoint,
      data: data,
    ).then((value) {
      if (value.statusCode == 200) {
        // debugPrint(value.data);
        datauser = UserData.fromJson(value.data);
        debugPrint(datauser.accessToken);
        accessToken = datauser.accessToken.toString();
        debugPrint(accessToken);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeLayout(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${value.statusMessage}")));
        debugPrint("error${value.statusCode}");
      }
    });
  }

  Future<void> login(String email, String password, context) async {
    var data = {"email": email, "password": password};
    await DioHelper.postData(
      url: loginEndPoint,
      data: data,
    ).then((value) {
      if (value.statusCode == 200) {
        datauser = UserData.fromJson(value.data);
        accessToken = datauser.accessToken;
        debugPrint(accessToken);
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
        debugPrint("error Login !!!!!!!!!!${value.statusCode}");
      } else {
        showTopSnackBar(
          context,
          const CustomSnackBar.info(
            backgroundColor: Colors.red,
            icon: Icon(Icons.question_mark_outlined),
            message: "Email or Password is not correct",
          ),
        );
      }
    });
  }
}
