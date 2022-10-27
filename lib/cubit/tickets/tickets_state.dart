part of 'tickets_cubit.dart';

@immutable
abstract class TicketsState {}

class TicketsInitial extends TicketsState {}


class GetAllTicketsLoadingState extends TicketsState {}
class GetAllTicketsSuccessfulState extends TicketsState {}
class GetAllTicketsErrorState extends TicketsState {}
