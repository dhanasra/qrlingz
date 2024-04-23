import 'package:qrlingz_app/base/base_viewmodel.dart';

import '../../../constants/data_const.dart';

class CreateViewModel extends BaseViewModel {
  
  
  getImagePath(String name){
    Map<String, dynamic>? socialItem = DataConst.qrItems["SOCIAL"]?.firstWhere((item) {
      return item["text"].toLowerCase() == name.toLowerCase();
    }, orElse: () => null);
    return socialItem?["image"];
  }

  @override
  dispose() {

  }
  
}