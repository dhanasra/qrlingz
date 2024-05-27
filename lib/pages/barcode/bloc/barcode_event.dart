part of 'barcode_bloc.dart';

@immutable
sealed class BarcodeEvent {}

class SaveBarcodeEvent extends BarcodeEvent {
  final BarcodeDesign design;
  final String value;
  final String name;
  final int type;
  SaveBarcodeEvent({required this.design, required this.name, required this.value, this.type = 2});
}