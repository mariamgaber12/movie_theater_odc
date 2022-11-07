import 'package:flutter/material.dart';
import 'package:odc_movie_theater/view/components/auth/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../res/colors.dart';

Widget buildDrawerList({required icon, required title}) {
  return ListTile(
    leading: Icon(
      icon,
      size: 32.5,
      color: mainColor,
    ),
    title: Text('$title',
        style: textStyleRoboto.copyWith(
            fontSize: 14, fontWeight: FontWeight.w400)),
  );
}

Widget buildCardMovie(
    {required image, required index, required name, required onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Stack(children: [
      Container(
        height: 203.17832946777344,
        width: 153.409912109375,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.09),
          borderRadius: BorderRadius.circular(7),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7.0),
          child: Image.network(
            image,
            fit: BoxFit.cover,
            width: 153.24,
            height: 202.72,
          ),
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
            child: Expanded(
              child: Text('$name',
                  maxLines: 3,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: textStyleRoboto.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  )),
            ),
          ),
        ),
      )
    ]),
  );
}

Widget buildIndicator({required activeIndex}) {
  return AnimatedSmoothIndicator(
    activeIndex: activeIndex = 2,
    count: 5,
    duration: const Duration(milliseconds: 55),
    curve: Curves.easeInOut,
    effect: ScrollingDotsEffect(
      activeDotColor: mainColor,
      activeStrokeWidth: 2.5,
      activeDotScale: 1.5,
      maxVisibleDots: 5,
      radius: 8.7,
      spacing: 10,
      dotHeight: 11.5,
      dotWidth: 11.5,
    ),
  );
}

Widget buildComingMovie(
    {required image, required index, required name, required date}) {
  return Stack(children: [
    Container(
      padding: const EdgeInsets.only(
        top: 12,
        right: 2.3,
        left: .52,
      ),
      height: 179,
      width: 281,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        color: thirdColor.withOpacity(.05),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.network(
          image,
          fit: BoxFit.cover,
          width: 281,
          height: 162,
        ),
      ),
    ),
    Positioned(
      top: 66,
      left: 118,
      child: CircleAvatar(
        backgroundColor: Colors.black26,
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.play_arrow_rounded,
            color: secondColor,
          ),
        ),
      ),
    ),
    Positioned(
      top: 117,
      left: 12,
      child: Column(
        children: [
          Text('$name',
              textAlign: TextAlign.center,
              style: textStyleRoboto.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              )),
          Text('$date',
              textAlign: TextAlign.center,
              style: textStyleRoboto.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w700,
              )),
        ],
      ),
    )
  ]);
}
