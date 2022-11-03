import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../res/colors.dart';

Widget buildDrawerList ({required icon,required title}) {
  return ListTile(
    leading: Icon(
      icon,
      color: mainColor,
    ),
    title: Text(
      '$title',
      style: GoogleFonts.roboto(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
    ),
  );
}

Widget buildCardMovie({required image, required index, required name,required onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Stack(children: [
      Container(
        height: 210,
        color: Colors.transparent,
        child: Image.network(
          image,
          fit: BoxFit.cover,
          width: 153.24,
          height: 202.72,
        ),
      ),
      Positioned(
        top: 150,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(7),
            width: 150,
            height: 70,
            child: Text(
              '$name',
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              softWrap: false,
              style: GoogleFonts.roboto(
                  fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
            ),
          ),
        ),
      )
    ]),
  );
}

Widget buildIndicator({required activeIndex}) {
  return AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: 3,
    effect: ScrollingDotsEffect(
      activeDotColor: mainColor,
      activeStrokeWidth: 2.7,
      activeDotScale: 1.7,
      maxVisibleDots: 5,
      radius: 8.9,
      spacing: 10,
      dotHeight: 12,
      dotWidth: 12,
    ),
  );
}

Widget buildComingMovie({
  required image,
  required index,
  required name,
  required date}) {
  return Stack(
      children: [
        Container(
      width: 281,
      height: 179,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.transparent,
      ),
      padding: const EdgeInsets.only(
        top: 12,
        right: 2.3,
        left: .52,
      ),
      child: Image.network(
        image,
        fit: BoxFit.cover,
        width: 283.24,
        height: 162,
      ),
    ),
        Positioned(
          top: 66,
          left: 118,
          child: CircleAvatar(
            backgroundColor: Colors.black26,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          top: 117,
          left: 12,
          child: Column(
            children: [
              Text(
                '$name',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
              ),
              Text(
                '$date',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                    fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ],
          ),
        )
  ]);
}