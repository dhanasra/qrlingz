import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:qrlingz_app/constants/url_const.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/network/firebase_client.dart';
import 'package:qrlingz_app/network/models/feedback_data.dart';

import '../../../network/local_db.dart';

part 'qr_code_event.dart';
part 'qr_code_state.dart';

class QrCodeBloc extends Bloc<QrCodeEvent, QrCodeState> {
  QrCodeBloc() : super(QrCodeInitial()) {
    on<SaveQREvent>(_onSaveQR);
    on<SaveQRConfigurationEvent>(_onSaveQRConfiguration);
  }

  final FirebaseClient _client = FirebaseClient();

  _onSaveQR(SaveQREvent event, Emitter emit)async{
    emit(Loading());
    try{

      var qrData = event.qrData;
      var docId = '${DateTime.now().millisecondsSinceEpoch}';

      if(event.isDynamic){
        
        final task = await _client.myQRStorageRef
          .child(docId).putFile(File(event.qrData.data["value"]));
        final downloadUrl = await task.ref.getDownloadURL();
        qrData = event.qrData.copyWith(data: {"value": "${UrlConst.domain}/q/${qrData.linkId}", "og": downloadUrl});
        
      }else if(event.qrData.name=="Feedback"){
          
        var feedback = (event.qrData.data['feedback'] as FeedbackData).toMap();
        var res = await _client.feedbackDB.add(feedback);
        var data = {
          "value": event.qrData.data['value'],
          "id": res.id
        };
        qrData = event.qrData.copyWith(data: data);
      }

      var dataMap = qrData.toMap();
      dataMap['createdBy'] = _client.userId;
      await _client.historyDB.doc(event.qrData.id).set(dataMap);

      await LocalDB().saveHistory(dataMap);

      emit(QRCodeCreated(data: qrData));
    }catch(error){
      emit(Failure());
    }
  }

  _onSaveQRConfiguration(SaveQRConfigurationEvent event, Emitter emit)async{
    emit(Loading());
    try{

      LocalDB().updateHistory(event.qrData.id, event.qrData.toMap());
      await _client.historyDB.doc(event.qrData.id).update(event.qrData.toMap());

      emit(QRCodeConfigured(data: event.qrData));
    }catch(error){
      emit(Failure());
    }
  }
}
