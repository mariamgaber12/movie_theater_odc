import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../cubit/main/main_cubit.dart';
import '../../../cubit/main/main_state.dart';
import '../../../res/colors.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  bool _selectColor0 = false;
  bool _selectColor1 = false;
  bool _selectColor2 = false;


  @override
  void initState() {
    super.initState();
    _selectColor0 = false;
    _selectColor1 = false;
    _selectColor2 = false;

  }
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
              setState((){
                if(index==0) {
                  _selectColor0 = true;
                  _selectColor1 = false;
                  _selectColor2 = false;
                } else if(index==1) {
                  _selectColor0 = false;
                  _selectColor1 = true;
                  _selectColor2 = false;
                } else if(index==2) {
                  _selectColor0 = false;
                  _selectColor1 = false;
                  _selectColor2 = true;
                }
              });
              },
            selectedItemColor: mainColor,
            showSelectedLabels: false,
            elevation: 0.0,
            selectedIconTheme: IconThemeData(color: mainColor,),
            items:  [
              BottomNavigationBarItem(
                label: '',
                icon:SvgPicture.asset('assets/Home.svg',
                  color: _selectColor0==true? mainColor: Colors.white12,
                )
              ),
              BottomNavigationBarItem(
                label: '',
                icon:
                SvgPicture.asset('assets/My Tickets.svg',
                  color: _selectColor1==true? mainColor: Colors.white12,
                )
              ),
              BottomNavigationBarItem(
                label: '',
                icon: SvgPicture.asset('assets/Search.svg',
                  color: _selectColor2==true? mainColor: Colors.white12,
                )
              ),
            ],
          ),
        );
      },
    );
  }
}
