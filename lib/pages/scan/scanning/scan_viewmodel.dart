import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/utils/utils.dart';
import 'package:scan/scan.dart';

class ScanViewModel extends BaseViewModel {
  
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  void onQRViewCreated(QRViewController controller, BuildContext context) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if(scanData.code!=null){
        var qrCode = QRData(
          id: "${DateTime.now().millisecondsSinceEpoch}", type: 1, name: getDataType(scanData.code!), data: {"value": scanData.code}, created: DateTime.now());
        context.goto(Routes.scanData, args: qrCode);
      }
    });
  }

  pickImage(BuildContext context)async{
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      File file = File(image.path);
      await Scan.parse(file.path).then(
        (data){
          if(data!=null){
            var qrCode = QRData(
              id: "${DateTime.now().millisecondsSinceEpoch}", type: 1, name: getDataType(data), data: {"value": data}, created: DateTime.now());
            context.goto(Routes.scanData, args: qrCode);
          }
      });
      
    }
  }

  @override
  dispose() {
    controller?.dispose();
  }

}