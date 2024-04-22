import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';

class ScanViewModel extends BaseViewModel {
  
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {

    });
  }
  
  @override
  dispose() {
    controller?.dispose();
  }

}