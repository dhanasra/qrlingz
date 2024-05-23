import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:qrlingz_app/network/models/barcode_data.dart';
import 'package:qrlingz_app/network/models/barcode_design.dart';

import '../../../network/local_db.dart';

part 'barcode_event.dart';
part 'barcode_state.dart';

class BarcodeBloc extends Bloc<BarcodeEvent, BarcodeState> {
  BarcodeBloc() : super(BarcodeInitial()) {
    on<SaveBarcodeEvent>(_onSaveBarcode);
  }

  _onSaveBarcode(SaveBarcodeEvent event, Emitter emit)async{
    emit(Loading());
    try{

      var barcode = BarcodeData(
        id: "${DateTime.now().millisecondsSinceEpoch}", 
        type: 2, 
        name: event.name, 
        value: event.value, 
        design: event.design, 
        created: DateTime.now(), 
      );

      await LocalDB.history?.put(barcode.id, barcode.toMap());

      emit(BarcodeCreated(data: barcode));
    }catch(error){
      emit(Failure());
    }
  }
}
