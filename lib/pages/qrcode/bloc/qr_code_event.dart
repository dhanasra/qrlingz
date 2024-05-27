part of 'qr_code_bloc.dart';

@immutable
sealed class QrCodeEvent {}

class SaveQREvent extends QrCodeEvent {
  final QRData qrData;
  final bool isDynamic;
  SaveQREvent({required this.qrData, required this.isDynamic});
}