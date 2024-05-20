import 'package:qrlingz_app/base/base_viewmodel.dart';

class BarcodeCustomizeViewModel extends BaseViewModel {

  late String barcodeType;
  late String barcodeData;
  
  BarcodeCustomizeViewModel(Map data, String name){
    barcodeData = data['value'];
    barcodeType = name;
  }

  @override
  dispose() {

  }
}