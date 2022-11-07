import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view_model/cubit/authentication/auth_cubit.dart';
import 'package:odc_movie_theater/view_model/cubit/authentication/auth_states.dart';
import '../../pages/authentication/login/login.dart';
import '../auth/components.dart';
import 'home_com.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: firstColor.withOpacity(.95),
      child: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            BlocConsumer<AuthenticationCubit, AuthenticationState>(
              listener: (context, state) {},
              builder: (context, state) {
                var userCubit = AuthenticationCubit.get(context);
                return Row(
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: mainColor, width: 3.5)),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: firstColor,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      userCubit.loginResponse.data!.name == ''
                          ? 'MariaM'
                          : userCubit.loginResponse.data!.name!,
                      style: textStyleRoboto.copyWith(
                          fontSize: 19, fontWeight: FontWeight.w700),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDrawerList(
                  title: 'Account',
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 35,
                ),
                buildDrawerList(
                  title: 'Settings',
                  icon: Icons.settings,
                ),
                const SizedBox(
                  height: 35,
                ),
                buildDrawerList(
                  title: 'About',
                  icon: Icons.question_mark,
                ),
                const SizedBox(
                  height: 35,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: buildDrawerList(
                    title: 'Logout',
                    icon: Icons.logout_outlined,
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
