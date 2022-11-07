import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/pages/tickets/view_ticket.dart';
import '../../../view_model/cubit/tickets/tickets_cubit.dart';
import '../../components/auth/components.dart';
import '../../components/home/home_drawer.dart';
import '../../components/tickets/my_tickets.dart';

class MyTickets extends StatelessWidget {
  const MyTickets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: firstColor,
      appBar: AppBar(
        backgroundColor: firstColor,
        title: Text(
          'MyTickets',
          style: textStyleRoboto.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => TicketsCubit()..getAllTickets(),
        child: BlocConsumer<TicketsCubit, TicketsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var ticketCubit = TicketsCubit.get(context);
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 29, top: 29),
                    child: Row(
                      children: [
                        Text(
                          "Today's ",
                          style: textStyleRoboto.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "tickets",
                          style: textStyleRoboto.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                buildTickets(
                  image: 'assets/card.png',
                  name: 'Spider Man No Way',
                  position: '4 Seats',
                  date: "9:00pm | 20 February",
                  onPressTicket: () {
                    navigateTo(context, const ViewTicket());
                  },
                ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 29,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Upcoming ",
                          style: textStyleRoboto.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "tickets",
                          style: textStyleRoboto.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(children: [
                    buildTickets(
                      image: 'assets/card.png',
                      name: 'Spider Man No Way',
                      position: '4 Seats',
                      date: "11:00pm | 27 February",
                      onPressTicket: () {
                        navigateTo(context, const ViewTicket());
                      },
                    ),

                  ]),
                ],
              ),
            );
          },
        ),
      ),
      drawer: const DrawerScreen(),
    );
  }
}
