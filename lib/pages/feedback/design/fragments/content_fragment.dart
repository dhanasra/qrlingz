// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/widgets/switcher.dart';

import '../../../../network/models/feedback_data.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/color_picker.dart';
import '../feedback_design_viewmodel.dart';

class ContentFragment extends StatelessWidget {
  final FeedbackDesignViewModel vm;
  const ContentFragment({super.key, required this.vm});

  update(key, value){
    
    var datamap = vm.data.value.toMap();

    datamap['design'] = datamap['design'] ?? {};
    datamap['design']['content'] = datamap['design']['content'] ?? {};

    datamap['design']['content'][key] = value;

    vm.data.value = FeedbackData.fromMap(datamap);
    vm.data.notifyListeners();
  }
  
  @override
  Widget build(BuildContext context) {

    var content = vm.data.value.design?.content;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [

        "Name Color".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(content?.companyColor),
          onChanged: (e){
            if(e!=null){
              update('companyColor', colorToString(e));
            }
          },
        ),
        20.h(),
        "Title Color".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(content?.titleColor),
          onChanged: (e){
            if(e!=null){
              update('titleColor', colorToString(e));
            }
          },
        ),
        20.h(),
        "Description Color".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(content?.descColor),
          onChanged: (e){
            if(e!=null){
              update('descColor', colorToString(e));
            }
          },
        ),
        20.h(),
        "Category Color".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(content?.categoryColor),
          onChanged: (e){
            if(e!=null){
              update('categoryColor', colorToString(e));
            }
          },
        ),
        20.h(),
        "Icon Color".ts(context),
        12.h(),
        ColorPicker(
          value: stringToColor(content?.iconColor),
          onChanged: (e){
            if(e!=null){
              update('iconColor', colorToString(e));
            }
          },
        ),
        20.h(),
        "Show Nav Icon".ts(context),
        12.h(),
        Switcher(
          value: content?.showNav ?? true,
          onChanged: (e){
            if(e!=null){
              update('showNav', e);
            }
          },
        ),
        20.h(),
      ],
    );
  }
}