// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/network/models/content_design.dart';
import 'package:qrlingz_app/pages/barcode/customize/barcode_customize_viewmodel.dart';
import 'package:qrlingz_app/widgets/layout_picker.dart';

import '../../../../utils/utils.dart';
import '../../../../widgets/color_picker.dart';
import '../../../../widgets/font_picker.dart';
import '../../../../widgets/slide_picker.dart';

class ContentFragment extends StatelessWidget {
  final BarcodeCustomizeViewModel vm;
  const ContentFragment({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    
    vm.content.text = '';

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        "Tagline".ts(context),
        12.h(),
        TextFormField(
          controller: vm.content,
          onChanged: (v)=>updateText(),
          decoration: const InputDecoration(
            hintText: "Enter the text here"
          ),
        ),
        20.h(),
        "Font".ts(context),
        12.h(),
        FontPicker(
          onChanged: (e){
            vm.design.value = vm.design.value = vm.design.value.copyWith(content: vm.design.value.content?.copyWith(
                  font: e["name"]
                ) ?? ContentDesign(font: e["name"])
              );
            vm.design.notifyListeners();
          }),
        20.h(),
        "Color".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(vm.design.value.content?.color),
          onChanged: (e){
            if(e!=null){
              vm.design.value = vm.design.value.copyWith(content: vm.design.value.content?.copyWith(
                  color: colorToString(e)
                ) ?? ContentDesign(color: colorToString(e))
              );
              vm.design.notifyListeners();
            }
          },
        ),
        20.h(),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: "Text Size".ts(context),  
        ),
        12.h(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2))
          ),
          child: SlidePicker(
            icon: Icons.text_fields_outlined,
            value: vm.design.value.content?.size,
            onChanged: (e){
              vm.design.value = vm.design.value.copyWith(content: vm.design.value.content?.copyWith(
                  size: e
                ) ?? ContentDesign(size: e)
              );
              vm.design.notifyListeners();
            }),
        ),
        20.h(),
        "Layout".ts(context),
        12.h(),
        LayoutPicker(
          type: vm.design.value.content?.layout,
          onChanged: (v){
            vm.design.value = vm.design.value.copyWith(content: vm.design.value.content?.copyWith(
                  layout: v
                ) ?? ContentDesign(layout: v)
              );
            vm.design.notifyListeners();
          }
        ),
      ],
    );
  }

  updateText(){
    vm.design.value = vm.design.value.copyWith(content: vm.design.value.content?.copyWith(
        text: vm.content.trim()
      ) ?? ContentDesign(text: vm.content.trim())
    );
  }
}