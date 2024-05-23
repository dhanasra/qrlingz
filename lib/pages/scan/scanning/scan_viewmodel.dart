import 'dart:io';

// import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart' as ml;
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/network/models/barcode_data.dart';
import 'package:qrlingz_app/network/models/barcode_design.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/utils/global.dart';
import 'package:qrlingz_app/utils/toast.dart';
import 'package:qrlingz_app/utils/utils.dart';
import 'package:vibration/vibration.dart';
import 'package:audioplayers/audioplayers.dart';

class ScanViewModel extends BaseViewModel {
  
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  String scannedData = "";

  void onQRViewCreated(QRViewController controller, BuildContext context) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {

      if(scanData.format==BarcodeFormat.qrcode && scanData.code!=null && scannedData!=scanData.code){
        scannedData = scanData.code!;
        handleScanData(scanData.code!, false, context);
      }else{
        handleScanData(scanData.code!, true, context, name: scanData.format.name);
      }
    });
  }

  pickImage(BuildContext context)async{
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      File file = File(image.path);

      final inputImage = ml.InputImage.fromFilePath(file.path);
      final barcodeScanner = ml.BarcodeScanner(formats: [ml.BarcodeFormat.all]);
      await barcodeScanner.processImage(inputImage).then(
        (barcodes){
          if (barcodes.isNotEmpty) {

            if(barcodes[0].rawValue==null && barcodes[0].displayValue==null){
              Toast.show(context, message: "Image does not contain valid qrcode!", type: "warning");
              return;
            }

            if(barcodes[0].format == ml.BarcodeFormat.qrCode){
              handleScanData(barcodes[0].rawValue ?? barcodes[0].displayValue!, true, context);
            }else{
              handleScanData(barcodes[0].rawValue ?? barcodes[0].displayValue!, false, context, name: barcodes[0].type.name);
            }
          } else {
            Toast.show(context, message: "Image does not contain valid qrcode!", type: "warning");
          }
        });
    }
  }

  handleScanData(String data, bool isQR, BuildContext context, {File? image, String? name}){
    if(Global.vibrateOnScan){
      Vibration.vibrate(duration: 500, amplitude: 255);
    }
    if(Global.soundOnScan){
      _playSound();
    }

    if(isQR){
      var qrCode = QRData(
        id: "${DateTime.now().millisecondsSinceEpoch}", type: 1, name: getDataType(data), data: {"value": data}, created: DateTime.now());
      context.goto(Routes.scanData, args: { 'data': qrCode, 'image': image});
    }else{
      var barcode = BarcodeData(
        id: "${DateTime.now().millisecondsSinceEpoch}", name: name??'', type: 3, value: data, design: BarcodeDesign(), created: DateTime.now());
      context.goto(Routes.barcodeData, args: { 'data': barcode, 'image': image});
    }
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