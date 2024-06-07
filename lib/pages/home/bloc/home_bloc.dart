import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/network/local_db.dart';
import 'package:qrlingz_app/network/models/barcode_data.dart';
import 'package:qrlingz_app/utils/global.dart';

import '../../../network/firebase_client.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetHistory>(_onGetHistory);
    on<RemoveHistory>(_onRemoveHistory);
  }
  
  final FirebaseClient _client = FirebaseClient();

  _onGetHistory(GetHistory event, Emitter emit)async{
    emit(HistoryLoading());
    try{
      // var stored = await LocalDB().getHistory();

      var data = await _client.historyDB.where('createdBy', isEqualTo: _client.userId).get();

      var values = data.docs.map((e) => e.data() as Map).toList();

      List<QRData> qrcodes = [];
      List<BarcodeData> barcodes = [];
      List<QRData> feedbacks = [];
      values.map((e){

        if(e['type']==0 || e['type']==1){
          if(e['name']=='Feedback'){
            feedbacks.add(QRData.fromMap(e));
          }else{
            qrcodes.add(QRData.fromMap(e));
          }
        }else{
          barcodes.add(BarcodeData.fromMap(e));
        }
      }).toList();

      var favourites = qrcodes.where((element) => element.isFavourite).toList();
      Global.favourites.value = favourites;

      emit(HistoryFetched(qrcodes: qrcodes, barcodes: barcodes, feedbacks: feedbacks));
    }catch(e){
      emit(HistoryFetched(barcodes: const [], qrcodes: const [], feedbacks: const []));
    }
  }

  _onRemoveHistory(RemoveHistory event, Emitter emit)async{
    emit(HistoryLoading());
    await LocalDB().removeHistory(event.id);
    add(GetHistory());
  }

}
