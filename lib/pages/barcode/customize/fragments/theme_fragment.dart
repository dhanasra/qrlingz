// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/pages/barcode/customize/barcode_customize_viewmodel.dart';

import '../../../../utils/utils.dart';
import '../../../../widgets/color_picker.dart';
import '../../../../widgets/font_picker.dart';
import '../../../../widgets/gradient_picker.dart';
import '../../../../widgets/slide_picker.dart';

class ThemeFragment extends StatelessWidget {
  final BarcodeCustomizeViewModel vm;
  const ThemeFragment({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        "Font".ts(context),
        12.h(),
        FontPicker(
          onChanged: (e){
            vm.design.value = vm.design.value.copyWith(
              font: e["name"]
            );
            vm.design.notifyListeners();
          }),
        20.h(),
        "Theme".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(vm.design.value.color),
          onChanged: (e){
            if(e!=null){
              vm.design.value = vm.design.value.copyWith(color: colorToString(e));
              vm.design.notifyListeners();
            }
          },
        ),
        20.h(),
        "Background".ts(context),
        12.h(),
        GradientPicker(
          value: vm.design.value.background,
          onChanged: (e){
            if(e!=null){
              vm.design.value = vm.design.value.copyWith(background: e);
              vm.design.notifyListeners();
            }
          },
        ),
        20.h(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: "Corner".ts(context),  
        ),
        12.h(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2))
          ),
          child: SlidePicker(
            icon: Icons.border_style_sharp,
            value: vm.design.value.borderRadius,
            onChanged: (e){
              vm.design.value = vm.design.value.copyWith(
                borderRadius: e 
              );
              vm.design.notifyListeners();
            }),
        ),
        20.h(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: "Outline".ts(context),  
        ),
        12.h(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2))
          ),
          child: SlidePicker(
            icon: Icons.border_all,
            value: vm.design.value.border,
            onChanged: (e){
              vm.design.value = vm.design.value.copyWith(
                border: e 
              );
              vm.design.notifyListeners();
            }),
        ),
        20.h(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: "Outline Color".ts(context),  
        ),
        12.h(),
        ColorPicker(
          value: stringToColor(vm.design.value.borderColor),
          onChanged: (e){
            if(e!=null){
              vm.design.value = vm.design.value.copyWith(borderColor: colorToString(e));
              vm.design.notifyListeners();
            }
          },
        ),
      ],
    );
  }
}