part of 'barcode_bloc.dart';

@immutable
sealed class BarcodeState {}

final class BarcodeInitial extends BarcodeState {}

final class Loading extends BarcodeState {}

final class BarcodeCreated extends BarcodeState {
  final BarcodeData data;
  BarcodeCreated({required this.data});
}

final class Failure extends BarcodeState {}