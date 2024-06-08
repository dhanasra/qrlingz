import 'package:flutter/material.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/network/models/feedback_category.dart';
import 'package:qrlingz_app/network/models/feedback_data.dart';
import 'package:qrlingz_app/routes/app_routes.dart';

class CreateFeedbackViewModel extends BaseViewModel {

  late ValueNotifier<int> activeStep;
  late PageController pageController;

  // step 1
  late TextEditingController nameController;
  late TextEditingController titleController;
  late TextEditingController descController;
  final GlobalKey<FormState> step1formkey = GlobalKey();
  late ValueNotifier<AutovalidateMode> step1mode;

  // step 2
  late ValueNotifier<List<Map>> items;
  final GlobalKey<FormState> step2formkey = GlobalKey();
  late ValueNotifier<AutovalidateMode> step2mode;

  // step 3
  bool emailMandatory = false;
  bool phoneMandatory = false;
  late TextEditingController websiteController;


  CreateFeedbackViewModel(){
    activeStep = ValueNotifier(0);
    pageController = PageController();

    nameController = TextEditingController();
    titleController = TextEditingController();
    descController = TextEditingController();
    websiteController = TextEditingController();
    step1mode = ValueNotifier(AutovalidateMode.disabled);

    step2mode = ValueNotifier(AutovalidateMode.disabled);

    items = ValueNotifier(
      [
        {
         'icon': null, 'name': TextEditingController()
        }
      ]
    );
  }

  goNext(BuildContext context, int index){
    

    if(index<3){

      if(index==1 && !step1formkey.currentState!.validate()){
        step1mode.value = AutovalidateMode.always;
        return; 
      }else if(index==2 && !step2formkey.currentState!.validate()){
        step2mode.value = AutovalidateMode.always;
        return; 
      }

      activeStep.value = index;
      pageController.jumpToPage(index);
    }else{

      var categories = items.value.map(
        (e) => FeedbackCategory(
          name: (e['name'] as TextEditingController).trim(),
          icon: e['icon']
        )).toList();

      var data = FeedbackData(
        company: nameController.trim(), 
        title: titleController.trim(),
        description: descController.trim(),
        categories: categories,
        emailMandatory: emailMandatory,
        phoneMandatory: phoneMandatory,
        websiteUrl: websiteController.trim()
      );

      context.goto(Routes.feedbackDesign, args: data);
    }
  }

  @override
  dispose() {

  }
}