import 'package:flutter/material.dart';

class Global {

  static List logos = [];
  
  static bool vibrateOnScan = true;
  static bool soundOnScan = true;
  static bool openLinkOnScan = true;
  static bool addScanToHistory = true;

  static ThemeMode mode = ThemeMode.light;

  static initialize(data){
    logos = data["logos"];
  }

}