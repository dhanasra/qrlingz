import 'package:flutter/material.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';

class CustomizeViewModel extends BaseViewModel {

  ValueNotifier<int?> active = ValueNotifier(null);

  var options = [
    {
      "type": 0,
      "name": "Templates",
      "icon": Icons.dashboard_outlined
    },
    {
      "type": 1,
      "name": "Color",
      "icon": Icons.color_lens_outlined
    },
    {
      "type": 2,
      "name": "Logo",
      "icon": Icons.image_outlined
    },
    {
      "type": 3,
      "name": "Pixels",
      "icon": Icons.image_outlined
    },
    {
      "type": 4,
      "name": "Text",
      "icon": Icons.text_fields_outlined
    }
  ];

  getTitleText(){
    switch(active.value){
      case 0: return "Templates";
      case 1: return "Color";
      case 2: return "Logo";
      case 3: return "Pixels";
      case 4: return "Text";
      default: return "Customize QR";
    }
  }
  
  @override
  dispose() {

  }

}