import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/pages/qrcode/customize/customize_viewmodel.dart';
import 'package:qrlingz_app/utils/utils.dart';
import 'package:qrlingz_app/widgets/color_picker.dart';
import 'package:qrlingz_app/widgets/font_picker.dart';

class TextCustomization extends StatelessWidget {
  final CustomizeViewModel vm;
  const TextCustomization({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {

    vm.textController.text = vm.qrData.text?["content"]??'';
    vm.color = vm.qrData.text?["color"];
    vm.font = vm.qrData.text?["font"];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        8.h(),
        TextFormField(
          controller: vm.textController,
          onChanged: (v)=>updateText(),
          decoration: const InputDecoration(
            hintText: "Enter the text here"
          ),
        ),
        16.h(),
        "Text Color".ts(context),
        12.h(),
        ColorPicker(
          onChanged: (e){
            if(e!=null){
              vm.color = colorToString(e);
              updateText();
            }
          },
        ),
        16.h(),
        "Font Family".ts(context),
        12.h(),
        FontPicker(onChanged: (v){
            vm.font = v["name"];
            updateText();
        })
      ],
    );
  }

  updateText(){
    vm.tempData.value = vm.tempData.value.copyWith(
      text: {
        "content": vm.textController.trim(),
        "color": vm.color,
        "font": vm.font
      });
  }
}