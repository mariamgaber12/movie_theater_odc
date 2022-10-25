import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../cubit/main/main_cubit.dart';
import '../../../cubit/main/main_state.dart';
import '../../../res/colors.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var homeCubit = MainCubit.get(context);
        return Scaffold(
          body: homeCubit.homeScreens[homeCubit.currentNavBarItem],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            currentIndex: homeCubit.currentNavBarItem,
            onTap: (index) {homeCubit.changeCurrentNavBarItem(index);},
            selectedItemColor: mainColor,
            showSelectedLabels: false,
            elevation: 0.0,
            selectedIconTheme: IconThemeData(
              color: mainColor,
            ),
            items:  [
              BottomNavigationBarItem(
                label: '',
                icon:SvgPicture.asset('assets/Home.svg')
              ),
              BottomNavigationBarItem(
                label: '',
                icon:
                SvgPicture.asset('assets/My Tickets.svg')
              ),
              BottomNavigationBarItem(
                label: '',
                icon: SvgPicture.asset('assets/Search.svg')
              ),
            ],
          ),
        );
      },
    );
  }
}
