import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/network/local_db.dart';
import 'package:qrlingz_app/utils/global.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetHistory>(_onGetHistory);
  }

  _onGetHistory(GetHistory event, Emitter emit)async{
    emit(HistoryLoading());
    var stored = await LocalDB().getHistory();
    var data = stored.values.map((e) => QRData.fromMap(e)).toList();
    var favourites = data.where((element) => element.isFavourite).toList();
    Global.favourites.value = favourites;
    emit(HistoryFetched(data: data));
  }


}
