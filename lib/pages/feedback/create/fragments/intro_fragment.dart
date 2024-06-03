import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/pages/feedback/create/create_feedback_viewmodel.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

import '../../../../utils/validator.dart';

class IntroFragment extends StatelessWidget {
  final CreateFeedbackViewModel vm;
  const IntroFragment({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: vm.step1mode,
      builder: (_, val, __) {
        return Form(
          autovalidateMode: val,
          key: vm.step1formkey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [ 
              "Basic Information".tl(context),
              16.h(),
              "Name *".ts(context),
              8.h(),
              TextFormField(
                controller: vm.nameController,
                validator: (v)=>Validator.validateNonNullOrEmpty(v,"Name"),
                decoration: const InputDecoration(
                  hintText: "Company or product to be reviewed",
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Title".ts(context),
              8.h(),
              TextFormField(
                controller: vm.titleController,
                decoration: const InputDecoration(
                  hintText: "Eg. Leave your feedback"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Description".ts(context),
              8.h(),
              TextFormField(
                controller: vm.descController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: "Eg. Select category to review"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              50.h(),
              Align(
                alignment: Alignment.centerRight,
                child: StyledButton(
                  w: 120,
                  onClick: ()=>vm.goNext(context, 1),
                  text: "Next",
                ),
              )
          
            ],
          ),
        );
      }
    );
  }
}