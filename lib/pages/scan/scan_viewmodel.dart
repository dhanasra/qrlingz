import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:scan/scan.dart';

class ScanViewModel extends BaseViewModel {
  
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {

    });
  }

  Future<String?> pickImage()async{
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      File file = File(image.path);
      String? data = await Scan.parse(file.path);
      if(data!=null){
        return data;
      }
    }else {
      return null;
    }
    return null;
  }

  @override
  dispose() {
    controller?.dispose();
  }

}