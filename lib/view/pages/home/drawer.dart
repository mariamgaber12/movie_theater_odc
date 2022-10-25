import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_movie_theater/res/colors.dart';

import '../../componentes/home/home_com.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children:[ Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 100,),

            //header
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.grey,
                  backgroundImage: const AssetImage('assets/img_1.png'),
                ),
                const SizedBox(
                  width: 23,
                ),
                Text(
                  'Mariam',
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),

            const SizedBox(height: 50,),
            //body
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDrawerScreen(title: 'Account',icon:Icons.person,),
                const SizedBox(height: 42,),
                buildDrawerScreen(title: 'Settings',icon:Icons.settings,),
                const SizedBox(height: 42,),
                buildDrawerScreen(title: 'About',icon:Icons.question_mark,),
                const SizedBox(height: 42,),
                buildDrawerScreen(title: 'Logout',icon:Icons.logout_outlined,),
              ],
            ),
          ],
        ),]
      ),
    );
  }
}