import 'dart:io';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/utils/global.dart';
import 'package:qrlingz_app/utils/notifications.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';

import '../../../network/local_db.dart';

class QrCodePreviewModel extends BaseViewModel {
  final ScreenshotController controller = ScreenshotController();
  late QRData qrdata;

  QrCodePreviewModel({data}){
    qrdata = data;
  }

  updateFavourite(isLiked){
    qrdata = qrdata.copyWith(isFavourite: isLiked);
    LocalDB().saveHistory(qrdata);
    if(isLiked){
      Global.favourites.value = [ ...Global.favourites.value, qrdata ];
    }else{
      Global.favourites.value = Global.favourites.value.where((element) => element.id!=qrdata.id).toList();
    }
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
      final result = await ImageGallerySaver.saveImage(bytes);
      AppNotification().showDownloadNotification(filePath: result['filePath']);
    }
  }

  
  @override
  dispose() {

  }

}