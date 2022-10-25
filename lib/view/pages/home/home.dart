import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/pages/home/drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        /*leading: GestureDetector(
          onTap: () {
           // navigateTo(context, DrawerScreen());
          },
          child:  Icon(Icons.menu_outlined,color: mainColor,)),*/
        title: Image.asset(
          'assets/img.png',
          width: 65,
          height: 54,
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/img_1.png'),fit: BoxFit.cover,opacity: .35),
        ),
        child: ListView(
          children: [
            SizedBox(height: 28,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Now Playing',
                  style: GoogleFonts.salsa(
                      color: Colors.white,
                      fontSize: 33,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),

            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Book your ticket now',
                  style: GoogleFonts.salsa(
                      color: mainColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),



          ],
        ),
      ),
      drawer: DrawerScreen(),
    );
  }
}
