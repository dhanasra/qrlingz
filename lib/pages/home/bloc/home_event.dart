part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class GetHistory extends HomeEvent {}

class UpdateHistory extends HomeEvent {}