import 'package:flutter/material.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/network/models/feedback_data.dart';

class FeedbackDesignViewModel extends BaseViewModel {
  late ValueNotifier<FeedbackData> data;

  FeedbackDesignViewModel(FeedbackData feedback){
    data = ValueNotifier(feedback);
  }
  
  @override
  dispose() {

  }
}