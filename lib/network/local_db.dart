import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qrlingz_app/models/qr_data.dart';

class LocalDB {

  static CollectionBox? history;

  static init()async{
    Directory appDocDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter();
    final boxCollection = await BoxCollection.open(
      'QRLingz', 
      {'history', 'favourites'}, 
      path: appDocDirectory.path
    );
    history = await boxCollection.openBox<Map>('history');
  }

  Future<void> saveHistory(QRData qrData) async =>await history?.put(qrData.id, qrData.toMap());
  removeHistory(String id) async =>await history?.delete(id);
  clearHistory() async =>await history?.clear();

  Future<Map> getHistory()async{
    var data = await history?.getAllValues();
    return data ?? {};
  }

}