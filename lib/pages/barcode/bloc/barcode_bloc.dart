import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:qrlingz_app/network/models/barcode_data.dart';
import 'package:qrlingz_app/network/models/barcode_design.dart';

import '../../../network/firebase_client.dart';
import '../../../network/local_db.dart';

part 'barcode_event.dart';
part 'barcode_state.dart';

class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {
  BarcodeBloc() : super(BarcodeInitial()) {
    on<SaveBarcodeEvent>(_onSaveBarcode);
  }

  final FirebaseClient _client = FirebaseClient();

  _onSaveBarcode(SaveBarcodeEvent event, Emitter emit)async{
    emit(Loading());
    try{

      var barcode = BarcodeData(
        id: "${DateTime.now().millisecondsSinceEpoch}", 
        type: event.type, 
        name: event.name, 
        value: event.value, 
        design: event.design, 
        created: DateTime.now(), 
      );

      var dataMap = barcode.toMap();
      dataMap['createdBy'] = _client.userId;
      await _client.historyDB.add(dataMap);

      await LocalDB().saveHistory(dataMap);

      emit(BarcodeCreated(data: barcode));
    }catch(error){
      emit(Failure());
    }
  }
}
