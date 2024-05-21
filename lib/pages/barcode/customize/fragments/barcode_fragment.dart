// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/network/models/code_design.dart';
import 'package:qrlingz_app/pages/barcode/customize/barcode_customize_viewmodel.dart';
import 'package:qrlingz_app/widgets/switcher.dart';

import '../../../../utils/utils.dart';
import '../../../../widgets/color_picker.dart';
import '../../../../widgets/font_picker.dart';
import '../../../../widgets/slide_picker.dart';

class BarcodeFragment extends StatelessWidget {
  final BarcodeCustomizeViewModel vm;
  const BarcodeFragment({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        "Barcode Color".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(vm.design.value.code?.color),
          onChanged: (e){
            if(e!=null){
              vm.design.value = vm.design.value.copyWith(
                code: vm.design.value.code?.copyWith(color: colorToString(e))
                ?? CodeDesign(color: colorToString(e)));
              vm.design.notifyListeners();
            }
          },
        ),
        20.h(),
        "Barcode Background".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(vm.design.value.code?.backgroundColor),
          onChanged: (e){
            if(e!=null){
              vm.design.value = vm.design.value.copyWith(
                code: vm.design.value.code?.copyWith(backgroundColor: colorToString(e))
                ?? CodeDesign(backgroundColor: colorToString(e)));
              vm.design.notifyListeners();
            }
          },
        ),
        20.h(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: "Barcode Padding".ts(context),  
        ),
        12.h(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2))
          ),
          child: SlidePicker(
            icon: Icons.padding_outlined,
            value: vm.design.value.code?.padding,
            onChanged: (e){
              vm.design.value = vm.design.value.copyWith(
                code: vm.design.value.code?.copyWith(padding: e)
                ?? CodeDesign(padding: e));
              vm.design.notifyListeners();
            }),
        ),
        20.h(),
        "Show Barcode Text".ts(context),
        12.h(),
        Switcher(
          value: vm.design.value.code?.showText ?? true, 
          onChanged: (e){
            vm.design.value = vm.design.value.copyWith(
                code: vm.design.value.code?.copyWith(showText: e)
                ?? CodeDesign(showText: e));
            vm.design.notifyListeners();
          }
        ),
        20.h(),
        "Font".ts(context),
        12.h(),
        FontPicker(
          onChanged: (e){
            vm.design.value = vm.design.value.copyWith(
                code: vm.design.value.code?.copyWith(font: e["name"])
                ?? CodeDesign(font: e["name"]));
            vm.design.notifyListeners();
          }),
        20.h(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: "Text Color".ts(context),  
        ),
        12.h(),
        ColorPicker(
          value: stringToColor(vm.design.value.code?.textColor),
          onChanged: (e){
            if(e!=null){
              vm.design.value = vm.design.value.copyWith(
                code: vm.design.value.code?.copyWith(textColor: colorToString(e))
                ?? CodeDesign(textColor:  colorToString(e)));
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
            value: vm.design.value.code?.textSize,
            onChanged: (e){
              vm.design.value = vm.design.value.copyWith(
                code: vm.design.value.code?.copyWith(textSize: e)
                ?? CodeDesign(textSize: e));
              vm.design.notifyListeners();
            }),
        )
      ],
    );
  }
}