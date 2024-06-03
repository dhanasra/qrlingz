// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/feedback/design/feedback_design_viewmodel.dart';
import 'package:qrlingz_app/network/models/feedback_data.dart';

import '../../../utils/utils.dart';
import '../../../widgets/color_picker.dart';
import '../../../widgets/font_picker.dart';
import '../../../widgets/gradient_picker.dart';
import '../../../widgets/slide_picker.dart';

class ThemeFragment extends StatelessWidget {
  final FeedbackDesignViewModel vm;
  const ThemeFragment({super.key, required this.vm});

  update(key, value){
    
    var datamap = vm.data.value.toMap();

    datamap['design'] = datamap['design'] ?? {};
    datamap['design']['theme'] = datamap['design']['theme'] ?? {};

    datamap['design']['theme'][key] = value;

    vm.data.value = FeedbackData.fromMap(datamap);
    vm.data.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    
    var theme = vm.data.value.design?.theme;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        "Font".ts(context),
        12.h(),
        FontPicker(
          onChanged: (e)=>update('font', e['name'])),
        20.h(),
        "Theme".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(theme?.header),
          onChanged: (e){
            if(e!=null){
              update('header', colorToString(e));
            }
          },
        ),
        20.h(),
        "Background".ts(context),
        12.h(),
        GradientPicker(
          value: theme?.background,
          onChanged: (e){
            if(e!=null){
              update('background', e);
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
            value: theme?.corner,
            onChanged: (e)=>update('corner', e)),
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
            value: theme?.border,
            onChanged: (e)=>update('border', e)),
        ),
        20.h(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: "Outline Color".ts(context),  
        ),
        12.h(),
        ColorPicker(
          value: stringToColor(theme?.borderColor),
          onChanged: (e){
            if(e!=null){
              update('borderColor', colorToString(e));
            }
          },
        ),
      ],
    );
  }
}