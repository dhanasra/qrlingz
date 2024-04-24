part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HistoryLoading extends HomeState {}

final class HistoryFetched extends HomeState {
  final List<QRData> data;
  HistoryFetched({required this.data});
}