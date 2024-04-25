import 'package:flutter/material.dart';
import 'package:qrlingz_app/models/qr_data.dart';

class Global {

  static List logos = [];
  
  static bool vibrateOnScan = true;
  static bool soundOnScan = true;
  static bool openLinkOnScan = true;
  static bool addScanToHistory = true;

  static ThemeMode mode = ThemeMode.light;

  static ValueNotifier<List<QRData>> favourites = ValueNotifier([]);

  static initialize(data){
    logos = data["logos"];
  }

}