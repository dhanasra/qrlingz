import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/utils/global.dart';
import 'package:qrlingz_app/utils/utils.dart';
import 'package:scan/scan.dart';
import 'package:vibration/vibration.dart';
import 'package:audioplayers/audioplayers.dart';

class ScanViewModel extends BaseViewModel {
  
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  void onQRViewCreated(QRViewController controller, BuildContext context) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if(scanData.code!=null){
        handleScanData(scanData.code!, context);
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
            handleScanData(data, context, image: file);
          }
      });
      
    }
  }

  handleScanData(String data, BuildContext context, {File? image}){
    if(Global.vibrateOnScan){
      Vibration.vibrate(duration: 500, amplitude: 255);
    }
    if(Global.soundOnScan){
      _playSound();
    }
    var qrCode = QRData(
      id: "${DateTime.now().millisecondsSinceEpoch}", type: 1, name: getDataType(data), data: {"value": data}, created: DateTime.now());
    context.goto(Routes.scanData, args: { 'data': qrCode, 'image': image});
  }

  Future<void> _playSound() async {
    AudioPlayer player = AudioPlayer();
    await player.play(AssetSource("res/audio/pop_sound.mp3"), volume: 100);
  }

  @override
  dispose() {
    controller?.dispose();
  }

}