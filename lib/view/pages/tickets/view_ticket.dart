import 'package:flutter/material.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/components/auth/components.dart';

import '../../components/tickets/my_tickets.dart';

class ViewTicket extends StatelessWidget {
  const ViewTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        title: Text(
          'View Ticket',
          style: textStyleRoboto.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          buildViewTicket(
              movie: 'Spiderman No Way Home',
              name: 'Mariam Gaber',
              seats: 'G5,G6,G7,G8',
              date: '20 Feb 2022',
              time: '9:00pm',
              npOrder: '7283603745',
              price: '150 EGP'
          ),
        ],
      ),
    );
  }
}
