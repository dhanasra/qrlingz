import 'dart:io';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

class QrCodePreviewModel extends BaseViewModel {
  final ScreenshotController controller = ScreenshotController();
  late QRData qrdata;

  QrCodePreviewModel({data}){
    qrdata = data;
  }

  shareQRCode()async{
    Directory directory = await getTemporaryDirectory();
    var imagePath = await controller.captureAndSave(directory.path, fileName: "captured_image.png");
    if(imagePath!=null){
      await Share.shareXFiles([XFile(imagePath)], text: qrdata.name);
    }
  }

  saveToGallery()async{
    var bytes = await controller.capture();
    if(bytes!=null){
      await ImageGallerySaver.saveImage(bytes);
    }
  }

  
  @override
  dispose() {

  }

}