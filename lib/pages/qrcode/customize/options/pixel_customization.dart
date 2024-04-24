import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/widgets/single_select.dart';

class PixelCustomization extends StatelessWidget {
  const PixelCustomization({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        "Pixel Style".ts(context),
        12.h(),
        SingleSelect(
          items: const [
            "Rounded",
            "Square"
          ], 
          value: "Rounded", 
          onChanged: (v){

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

          }),
      ],
    );
  }
}