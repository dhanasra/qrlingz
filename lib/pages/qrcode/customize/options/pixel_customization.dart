import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/widgets/single_select.dart';

import '../customize_viewmodel.dart';

class PixelCustomization extends StatelessWidget {
  final CustomizeViewModel vm;
  const PixelCustomization({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        "Pixel Style".ts(context),
        12.h(),
        SingleSelect(
          items: const [
            "Square",
            "Rounded"
          ], 
          value: vm.tempData.value.pixels?["type"]??"Square", 
          onChanged: (v){
            vm.type = v;
            update();
          }),
        20.h(),
        "Corner Style".ts(context),
        12.h(),
        SingleSelect(
          items: const [
            "Smooth",
            "Rough"
          ], 
          value: "Smooth", 
          onChanged: (v){
            vm.corner = v;
            update();
          }),
      ],
    );
  }

  update(){
    vm.tempData.value = vm.tempData.value.copyWith(
      pixels: {
        "type": vm.type,
        "corner": vm.corner
      });
  }
}