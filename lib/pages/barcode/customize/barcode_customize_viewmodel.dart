import 'package:flutter/material.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/network/firebase_client.dart';
import 'package:qrlingz_app/network/models/barcode_data.dart';
import 'package:qrlingz_app/network/models/barcode_design.dart';

import '../../../routes/app_routes.dart';

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

  saveBarcode(BuildContext context){

    var barcode = BarcodeData(
      id: 'test', 
      name: '', 
      value: barcodeData, 
      design: design.value, 
      created: DateTime.now(), 
      createdBy: FirebaseClient().userId ?? ''
    );

    context.goto(Routes.barcodeView, args: barcode);
  }

  @override
  dispose() {

  }
}