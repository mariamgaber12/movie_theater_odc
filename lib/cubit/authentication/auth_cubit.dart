import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/pages/tickets/my_tickets.dart';
import '../../res/consts.dart';
import '../../view/pages/home/home.dart';
import '../../view/pages/home/home_layout.dart';
import '../../view/pages/search/search.dart';
import '../../view_model/models/data_user.dart';
import '../../view_model/network/dio_helper.dart';
import '../../view_model/network/end_points.dart';
import 'auth_states.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(LoginInitial());
  static AuthenticationCubit get(context) => BlocProvider.of(context);

  List<Widget> homeScreens = [
    const Home(),
    const MyTickets(),
    const Search(),
  ];

  int currentNavBarItem = 0;
  var color;
  void changeCurrentNavBarItem(int index) {
    currentNavBarItem = index;
    if (index == 0) {
      const Home();
      color=mainColor;
    }
    if (index == 1) {
      MyTickets();
      color=mainColor;
    }
    if (index == 2) {
      Search();
      color=mainColor;
    }
    emit(ChangeBottomNavBar());
  }

  UserData datauser = UserData();

/*
  Future<void> signup(String firstName, String lastName, String email,
      String password, context) async {
    var data = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password
    };
    await DioHelper.postData(
      url: SIGNUP,
      data: data,
    ).then((value) {
      if (value.statusCode == 200) {
        // debugPrint(value.data);
        datauser = UserData.fromJson(value.data);
        debugPrint(datauser.data!.accessToken);
        TOKEN = datauser.data!.accessToken.toString();
        debugPrint(TOKEN);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SendGift() as Widget,
          ),
        );
        debugPrint(datauser.data!.user!.lastName);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${value.statusMessage}")));
        debugPrint("error${value.statusCode}");
      }
    });
  }
*/

  Future<void> login(String email, String password, context) async {
    var data = {"email": email, "password": password};
    await DioHelper.postData(
      url: loginEndPoint,
      data: data,
    ).then((value) {
      print('hello');
      if (value.statusCode == 200) {
        print('hello0000000000000000000000');
        datauser = UserData.fromJson(value.data);
        accessToken = datauser.accessToken;
        debugPrint(accessToken);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeLayout() as Widget,
          ),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("${value.statusMessage}")));
        debugPrint("error Login !!!!!!!!!!${value.statusCode}");
      }
    });
  }
}
