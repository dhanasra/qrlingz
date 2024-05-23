import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/network/models/barcode_data.dart';
import 'package:qrlingz_app/utils/toast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BarcodeDataViewModel extends BaseViewModel {
  final BarcodeData barcode;
  BarcodeDataViewModel({required this.barcode});

  copyCode(BuildContext context){
    Clipboard.setData(ClipboardData(text: barcode.value));
    Toast.show(context, message: "Copied successfully!");
  }

  shareCode(){
    Share.share(barcode.value);
  }

  searchInWeb(BuildContext context)async{
    launchUrlString('https://www.google.com/search?q=${barcode.value}');
  }

  @override
  dispose() {

  }

}