import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odc_movie_theater/view_model/models/tickets/tickets.dart';
import 'package:odc_movie_theater/view_model/network/end_points.dart';

import '../../res/consts.dart';
import '../../view_model/network/dio_helper.dart';

part 'tickets_state.dart';

class TicketsCubit extends Cubit<TicketsState> {
  TicketsCubit() : super(TicketsInitial());

  static TicketsCubit get(context) => BlocProvider.of(context);

  List<Tickets> allTickets = [];
  List<Tickets> todayTickets = [];
  List<Tickets> upcomingTickets = [];

  void getAllTickets() {
    allTickets.clear();
    emit(GetAllTicketsLoadingState());
    DioHelper.getData(
      url: ticketsEndPpoint,
      token : accessToken,
    ).then((value) {
      print(value.data);
     /* for (var element in value.data) {
        allTickets.add(Tickets.fromJson(element));
      }
      print(allTickets[0].movieDate!.date);*/
      emit(GetAllTicketsSuccessfulState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetAllTicketsErrorState());
    });
  }

/*
  void getAllTickets() {
    allTickets.clear();
    todayTickets.clear();
    upcomingTickets.clear();
    emit(GetAllTicketsLoadingState());
    DioHelper.getData(
      url: ticketsEndPpoint,
      token: accessToken,
    ).then((value) {
      _getTodayTickets(value);
      _getUpcomingTickets(value);
      emit(GetAllTicketsSuccessfulState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetAllTicketsErrorState());
    });
  }

  void _getTodayTickets(Response<dynamic> response) {
    todayTickets.clear();
    for (var element in response.data['data']['today']) {
      allTickets.add(Tickets.fromJson(element));
      todayTickets.add(Tickets.fromJson(element));
    }
  }

  void _getUpcomingTickets(Response<dynamic> response) {
    upcomingTickets.clear();
    for (var element in response.data['data']['upcoming']) {
      allTickets.add(Tickets.fromJson(element));
      upcomingTickets.add(Tickets.fromJson(element));
    }
  }
*/
}