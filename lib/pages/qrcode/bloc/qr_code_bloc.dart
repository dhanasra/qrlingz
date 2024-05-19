import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/network/firebase_client.dart';

import '../../../network/local_db.dart';

part 'qr_code_event.dart';
part 'qr_code_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QrCodeBloc() : super(QrCodeInitial()) {
    on<SaveFileQREvent>(_onSaveFileQR);
  }

  final FirebaseClient _client = FirebaseClient();

  _onSaveFileQR(SaveFileQREvent event, Emitter emit)async{
    emit(Loading());
    try{

      final task = await _client.myQRStorageRef.putFile(File(event.qrData.data["value"]));
      final downloadUrl = await task.ref.getDownloadURL();
      var qrData = event.qrData.copyWith(data: {"value": downloadUrl});

      var dataMap = qrData.toMap();
      dataMap['createdBy'] = _client.userId;
      await _client.qrsInfoDB.add(dataMap);

      await LocalDB().saveHistory(qrData);

      emit(QRCodeCreated(data: qrData));
    }catch(error){
      emit(Failure());
    }
  }
}
