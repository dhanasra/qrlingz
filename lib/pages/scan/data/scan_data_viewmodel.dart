import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/utils/toast.dart';
import 'package:qrlingz_app/utils/utils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../network/local_db.dart';
import '../../../utils/global.dart';

class ScanDataViewModel extends BaseViewModel {
  final QRData qr;
  late String dataType;
  ScanDataViewModel({required this.qr}){
    dataType = getDataType(qr.data["value"]);
    if(dataType=="Website" && Global.openLinkOnScan){
      launchUrlString(qr.data['value']);
    }

    if(Global.addScanToHistory){
      LocalDB().saveHistory(qr);
    }
  }
  

  copyCode(BuildContext context){
    Clipboard.setData(ClipboardData(text: qr.data["value"]));
    Toast.show(context, message: "Copied successfully!");
  }

  shareCode(){
    Share.share(qr.data["value"]);
  }

  openWebsite(BuildContext context)async{
    await canLaunchUrlString(qr.data['value']).then(
      (value)async{
        if(value){
          await launchUrlString(qr.data['value']);
        }else{
          Toast.show(context, message: "Invalid url found. Can't Open This Url.");
        }
      });
  }

  openUrl()async{
    await launchUrlString(qr.data['value']);
  }

  saveContact(BuildContext context)async{
    await saveVCard(data: qr.data['value']);
  }

  @override
  dispose() {

  }

}