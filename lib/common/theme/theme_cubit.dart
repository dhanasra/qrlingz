import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:qrlingz_app/network/local_db.dart';
import 'package:qrlingz_app/utils/global.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(Global.mode);

  void toggleTheme(ThemeMode mode)async{
    await LocalDB().saveSettings('theme', {'mode': mode.name});
    emit(mode);
  }
}
