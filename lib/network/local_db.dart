import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/utils/global.dart';
import 'package:qrlingz_app/utils/utils.dart';

class LocalDB {

  static CollectionBox? history;
  static CollectionBox? settings;

  static init()async{
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter();
    final boxCollection = await BoxCollection.open(
      'QRLingz', 
      {'history', 'settings'}, 
      path: appDocDirectory.path
    );
    history = await boxCollection.openBox<Map>('history');
    settings = await boxCollection.openBox<Map>('settings');

    var data = await settings?.getAllValues();
    Global.addScanToHistory = data?['addScanToHistory']?['enabled']??true;
    Global.soundOnScan = data?['sound']?['enabled']??true;
    Global.vibrateOnScan = data?['vibrate']?['enabled']??true;
    Global.openLinkOnScan = data?['autoOpen']?['enabled']??true;
    Global.mode = ThemeMode.values.firstWhere((element) => element.name == data?['theme']?['mode'], orElse: ()=>ThemeMode.light);
  }

  Future<void> saveHistory(QRData qrData) async =>await history?.put(qrData.id, qrData.toMap());
  removeHistory(String id) async =>await history?.delete(id);
  clearHistory() async =>await history?.clear();

  Future<void> saveSettings(key, value) async =>await settings?.put(key, value);

  Future<Map> getHistory()async{
    var data = await history?.getAllValues();
    return data ?? {};
  }

  Future<Locale> getLangcode()async{
    var data = await settings?.getAllValues();
    var languageCode = data?['language']?['code']??"en";
    return getLocale(languageCode);
  }

}