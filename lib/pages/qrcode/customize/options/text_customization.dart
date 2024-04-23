import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/widgets/color_picker.dart';
import 'package:qrlingz_app/widgets/font_picker.dart';

class TextCustomization extends StatelessWidget {
  const TextCustomization({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        8.h(),
        TextFormField(
          decoration: const InputDecoration(
            hintText: "Enter the text here"
          ),
        ),
        16.h(),
        "Text Color".ts(context),
        12.h(),
        ColorPicker(
          onChanged: (e){

          },
        ),
        16.h(),
        "Font Family".ts(context),
        12.h(),
        FontPicker(onChanged: (v){},)

      ],
    );
  }
}