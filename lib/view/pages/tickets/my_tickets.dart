import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odc_movie_theater/cubit/tickets/tickets_cubit.dart';
import 'package:odc_movie_theater/res/colors.dart';
import 'package:odc_movie_theater/view/componentes/auth/components.dart';
import 'package:odc_movie_theater/view/componentes/tickets/my_tickets.dart';
import 'package:odc_movie_theater/view/pages/tickets/view_ticket.dart';
import '../../componentes/home/home_com.dart';

class MyTickets extends StatelessWidget {
  const MyTickets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'MyTickets',
          style: GoogleFonts.roboto(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
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
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Text(
                          "tickets",
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  ticketCubit.allTickets.isEmpty?
                  CircularProgressIndicator(color: mainColor,)
                  :buildTickets(
                    image: ticketCubit.allTickets[0].movieDate!.movie!.imageUrl!,
                    name: ticketCubit.allTickets[0].movieDate!.movie!.name!,
                    position: ticketCubit.allTickets[0].movieDate!.reservedSeats!,
                    date: ticketCubit.allTickets[0].movieDate!.date!,
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
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Text(
                          "tickets",
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Column(children: [
                    buildTickets(
                      image: 'assets/card.png',
                      name: 'Spider Man No Way',
                      position: '4 Seats',
                      date: "9:00pm | 20 February",
                      onPressTicket: () {
                        navigateTo(context, const ViewTicket());
                      },
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
                    buildTickets(
                      image: 'assets/card.png',
                      name: 'Spider Man No Way',
                      position: '4 Seats',
                      date: "9:00pm | 20 February",
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
      drawer: buildDrawerScreen(),
    );
  }
}
