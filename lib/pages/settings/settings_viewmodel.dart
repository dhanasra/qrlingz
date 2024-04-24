import 'package:device_info_plus/device_info_plus.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsViewModel extends BaseViewModel {
  
  
  recommendApp()async{
    await Share.share("Transform your QR codes into stunning works of art with QR Code Generator - Fast & Easy! Choose from a variety of ready-made templates and customize them to match your style effortlessly. Simplify the process and elevate your QR code game today! Download now and see the difference.\n\nhttps://play.google.com/store/apps/details?id=com.spiderlingz.qrlingz");
  }

  sendReportOrFeedback(String type)async{
    
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'support@spiderlingz.com',
      query: 'subject=$type&body=Model: ${androidInfo.model}\nBrand: ${androidInfo.brand}\nAndroid Version: ${androidInfo.version.release}\nManufacturer: ${androidInfo.manufacturer}',
    );

    launchUrl(emailLaunchUri);
  }

  @override
  dispose() {

  }
}