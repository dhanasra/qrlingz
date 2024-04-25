import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/utils/utils.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../utils/global.dart';

class ScanDataViewModel extends BaseViewModel {
  final QRData qr;
  ScanDataViewModel({required this.qr}){
    var dataType = getDataType(qr.data["value"]);
    if(dataType=="Website" && Global.openLinkOnScan){
      launchUrlString(qr.data['value']);
    }
  }
  
  @override
  dispose() {

  }

}