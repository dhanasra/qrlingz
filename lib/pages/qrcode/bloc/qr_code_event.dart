part of 'qr_code_bloc.dart';

@immutable
sealed class QrCodeEvent {}

class SaveFileQREvent extends QrCodeEvent {
  final QRData qrData;
  SaveFileQREvent({required this.qrData});
}