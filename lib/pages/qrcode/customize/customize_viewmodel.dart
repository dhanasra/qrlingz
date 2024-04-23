import 'package:flutter/material.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';

class CustomizeViewModel extends BaseViewModel {

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
      "name": "Eye",
      "icon": Icons.remove_red_eye_outlined
    },
    {
      "type": 5,
      "name": "Text",
      "icon": Icons.text_fields_outlined
    }
  ];

  
  @override
  dispose() {

  }

}