import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/models/qr_data.dart';

class ScanDataViewModel extends BaseViewModel {
  final QRData qr;
  ScanDataViewModel({required this.qr});
  
  @override
  dispose() {
  }

}