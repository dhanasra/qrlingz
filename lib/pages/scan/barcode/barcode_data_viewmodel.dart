import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/network/models/barcode_data.dart';
import 'package:qrlingz_app/pages/barcode/bloc/barcode_bloc.dart';
import 'package:qrlingz_app/utils/toast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../utils/global.dart';

class BarcodeDataViewModel extends BaseViewModel {
  final BarcodeData barcode;
  BarcodeDataViewModel({required BuildContext context, required this.barcode}){
    if(Global.addScanToHistory){
      context.read<BarcodeBloc>().add(SaveBarcodeEvent(
        design: barcode.design,
        value: barcode.value,
        name: barcode.name,
        type: barcode.type
      ));
    }
  }

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