import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../res/colors.dart';
import '../../../view_model/cubit/main/main_cubit.dart';
import '../../../view_model/cubit/main/main_state.dart';

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
            onTap: (index) {
              homeCubit.changeCurrentNavBarItem(index);
              },
            items:  [
              BottomNavigationBarItem(
                label: '',
                activeIcon: SvgPicture.asset('assets/Home.svg',color: mainColor,),
                icon:SvgPicture.asset('assets/Home.svg', color: Colors.white12,),
              ),
              BottomNavigationBarItem(
                label: '',
                activeIcon:  SvgPicture.asset('assets/My Tickets.svg',color: mainColor,),
                icon:
                SvgPicture.asset('assets/My Tickets.svg', color: Colors.white12,),
              ),
              BottomNavigationBarItem(
                label: '',
                activeIcon: SvgPicture.asset('assets/Search.svg',color: mainColor,),
                icon: SvgPicture.asset('assets/Search.svg', color: Colors.white12,)
              ),
            ],
          ),
        );
      },
    );
  }
}
