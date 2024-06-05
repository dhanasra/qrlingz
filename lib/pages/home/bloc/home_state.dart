part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HistoryLoading extends HomeState {}

final class HistoryFetched extends HomeState {
  final List<QRData> qrcodes;
  final List<QRData> feedbacks;
  final List<BarcodeData> barcodes;
  HistoryFetched({required this.barcodes, required this.qrcodes, required this.feedbacks});
}