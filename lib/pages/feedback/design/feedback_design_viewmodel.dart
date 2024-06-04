import 'package:flutter/material.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/network/models/feedback_data.dart';
import 'package:qrlingz_app/utils/utils.dart';

import '../../../constants/url_const.dart';
import '../../../routes/app_routes.dart';

class FeedbackDesignViewModel extends BaseViewModel {
  late ValueNotifier<FeedbackData> data;

  FeedbackDesignViewModel(FeedbackData feedback){
    data = ValueNotifier(feedback);
  }
  
  handleSave(BuildContext context){
    var linkId = generateUniqueString();
    var map = {"value": "${UrlConst.domain}/f/$linkId", "feedback": data.value };
    context.goto(Routes.customize, args: { 
                    "data": map, 
                    "name": "Feedback",
                    "linkId": linkId 
                  });
  }
  
  @override
  dispose() {

  }
}