part of 'qr_code_bloc.dart';

@immutable
sealed class QrCodeState {}

final class QrCodeInitial extends QrCodeState {}

final class Loading extends QrCodeState {}

final class QRCodeCreated extends QrCodeState {
  final QRData data;
  QRCodeCreated({required this.data});
}

final class Failure extends QrCodeState {}

