import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/network/local_db.dart';
import 'package:qrlingz_app/network/models/barcode_data.dart';
import 'package:qrlingz_app/utils/global.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetHistory>(_onGetHistory);
    on<RemoveHistory>(_onRemoveHistory);
  }

  _onGetHistory(GetHistory event, Emitter emit)async{
    emit(HistoryLoading());
    try{
      var stored = await LocalDB().getHistory();
      List<QRData> qrcodes = [];
      List<BarcodeData> barcodes = [];
      stored.values.map((e){
        if(e['type']==0){
          qrcodes.add(QRData.fromMap(e));
        }else{
          barcodes.add(BarcodeData.fromMap(e));
        }
      }).toList();

      var favourites = qrcodes.where((element) => element.isFavourite).toList();
      Global.favourites.value = favourites;

      emit(HistoryFetched(qrcodes: qrcodes, barcodes: barcodes));
    }catch(e){
      emit(HistoryFetched(barcodes: const [], qrcodes: const []));
    }
  }

  _onRemoveHistory(RemoveHistory event, Emitter emit)async{
    emit(HistoryLoading());
    await LocalDB().removeHistory(event.id);
    add(GetHistory());
  }

}
