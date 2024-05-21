import 'package:flutter/material.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/network/models/barcode_design.dart';

class BarcodeCustomizeViewModel extends BaseViewModel {
  late ValueNotifier<BarcodeDesign> design;
  late String barcodeType;
  late String barcodeData;
  late TextEditingController content;
  
  BarcodeCustomizeViewModel(Map data, String name){
    barcodeData = data['value'];
    barcodeType = name;
    design = ValueNotifier(BarcodeDesign());
    content = TextEditingController();
  }

  @override
  dispose() {

  }
}