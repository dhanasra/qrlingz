part of 'qr_code_bloc.dart';

@immutable
sealed class QrCodeEvent {}

class SaveQREvent extends QrCodeEvent {
  final QRData qrData;
  final bool isDynamic;
  SaveQREvent({required this.qrData, this.isDynamic = false});
}

class SaveQRConfigurationEvent extends QrCodeEvent {
 final QRData qrData;
  SaveQRConfigurationEvent({required this.qrData});
} 