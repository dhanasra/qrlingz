import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/network/local_db.dart';
import 'package:qrlingz_app/utils/global.dart';
import 'package:qrlingz_app/widgets/language_sheet.dart';
import 'package:qrlingz_app/widgets/theme_sheet.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/theme/theme_cubit.dart';

class SettingsViewModel extends BaseViewModel {

  openThemeSheet(BuildContext context){
     showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_){ 
        return ThemeSheet(
          onSave: (v){
            Future.delayed(const Duration(milliseconds: 500), (){
              context.read<ThemeCubit>().toggleTheme(v);
            });
          },
        );
      }
    );
  }

  openLanguageSheet(BuildContext context){
     showModalBottomSheet(
      context: context, 
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_){ 
        return LanguageSheet(
          onSave: (v){
            // Future.delayed(const Duration(milliseconds: 500), (){
            //   context.read<ThemeCubit>().toggleTheme(v);
            // });
          },
        );
      }
    );
  }
  
  updateSettings(key, value)async{
    await LocalDB().saveSettings(key, {'enabled': value});
    if(key=="vibrate"){
      Global.vibrateOnScan = value;
    }else if(key=="sound"){
      Global.soundOnScan = value;
    }else if(key=="autoOpen"){
      Global.openLinkOnScan = value;
    }else if(key=="addScanToHistory"){
      Global.addScanToHistory = value;
    } 
  }

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