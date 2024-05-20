import 'package:flutter/material.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';

import '../../../routes/app_routes.dart';

class BarcodeCreateViewModel extends BaseViewModel {

  String? barcodeType;
  final ValueNotifier<AutovalidateMode> mode = ValueNotifier(AutovalidateMode.disabled);
  final GlobalKey<FormState> formKey = GlobalKey();
  
  late TextEditingController controller;

  BarcodeCreateViewModel(String type){
    controller = TextEditingController();
    barcodeType = type;
  }

  saveBarcode(BuildContext context){
    if(!formKey.currentState!.validate()){
      mode.value = AutovalidateMode.always;
      return;
    }
    context.goto(Routes.barcodeCustomize, args: { 
      "data": {
        "value": controller.trim(),
      }, 
      "name": barcodeType
    });
  }


  @override
  dispose() {
    
  }

}