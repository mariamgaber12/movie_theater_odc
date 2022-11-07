import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_movie_theater/view_model/models/tickets/tickets.dart';
import '../../database/local/shared_preference/cache_keys.dart';
import '../../database/network/dio_helper.dart';
import '../../database/network/end_points.dart';
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
      url: getTicketsEndPoint,
      token: CacheKeysManger.getUserTokenFromCache(),
    ).then((value) {
      print(value.data);
      for (var element in value.data) {
        allTickets.add(Tickets.fromJson(element));
      }
      print(allTickets[0].movieDate!.date);
      emit(GetAllTicketsSuccessfulState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetAllTicketsErrorState());
    });
  }

  Tickets bookTicketsResponse = Tickets();

  Future<void> bookTickets({
    required List<String> seats,
    required movieDateId,
    required additionalProp1,
  }) async {
    emit(BookTicketsLoadingState());
    var data = {
      "seats": seats,
      "movieDateId": movieDateId,
      "additionalProp1": {}
    };
    await DioHelper.postData(
      url: bookTicketsEndPoint,
      data: data,
    ).then((value) {
      print(value.data);
      bookTicketsResponse = Tickets.fromJson(value.data);
      emit(BookTicketsSuccessfulState());
    }).catchError((error) {
      if (error is DioError) {
        emit(BookTicketsErrorState(
            message: error.response!.data["message"].toString()));
      }
    });
  }
}
