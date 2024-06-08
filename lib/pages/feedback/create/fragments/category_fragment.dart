// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/pages/feedback/create/create_feedback_viewmodel.dart';
import 'package:qrlingz_app/utils/utils.dart';
import 'package:qrlingz_app/widgets/feedback_category_item.dart';

import '../../../../widgets/styled_button.dart';

class CategoryFragment extends StatelessWidget {
  final CreateFeedbackViewModel vm;
  const CategoryFragment({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: vm.step2mode,
      builder: (_, autoValidate, __) {
        return Form(
          key: vm.step2formkey,
          autovalidateMode: autoValidate,
          child: ValueListenableBuilder(
            valueListenable: vm.items,
            builder: (_, val, __) {
              return ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  "Review Categories".tl(context),
                  16.h(),
                  
                  ...val.map((e) => FeedbackCategoryItem(
                    index: val.indexOf(e),
                    controller: e['name'],
                    icon: getFeedbackIcons()[e['icon']],
                    onIconAdd: (icon){
                      var index = val.indexOf(e);
                      var item = val[index];
                      item['icon'] = icon;
                      vm.items.value[index] = item;
                      vm.items.notifyListeners();
                    },
                    onDelete: (){
                      vm.items.value.remove(e);
                      vm.items.notifyListeners();
                    },
                  )),
              
                  Row(
                    children: [
                      SizedBox(
                        width: 140,
                        child: OutlinedButton(
                          onPressed: (){
                            vm.items.value.add({
                              'icon': null, 'name': TextEditingController()
                            });
                            vm.items.notifyListeners();
                          }, 
                          child: const Text("Add Category")
                        ),
                      ),
              
                    ],
                  ),
          
                  50.h(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: StyledButton(
                      w: 120,
                      onClick: ()=>vm.goNext(context, 2),
                      text: "Next",
                    ),
                  )
                  
                ],
              );
            }
          ),
        );
      }
    );
  }
}