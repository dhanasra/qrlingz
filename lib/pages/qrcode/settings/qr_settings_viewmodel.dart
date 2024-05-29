import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/network/models/configuration.dart';
import 'package:qrlingz_app/pages/qrcode/bloc/qr_code_bloc.dart';

class QRSettingsViewModel extends BaseViewModel {
  final QRData qrData;
  final GlobalKey<FormState> formkey = GlobalKey();
  late ValueNotifier<AutovalidateMode> mode;

  late TextEditingController scanLimitController;
  late TextEditingController pwController;

  late ValueNotifier<bool> passwordVisible;

  QRSettingsViewModel (this.qrData){
    scanLimitController = TextEditingController();
    pwController = TextEditingController();
    
    mode = ValueNotifier(AutovalidateMode.disabled);
    passwordVisible = ValueNotifier(false);
  }

  handleSave(BuildContext context, bool enablePassword, bool enableScanLimit){
    if(!formkey.currentState!.validate()){
        mode.value = AutovalidateMode.always;  
        return;
    }

    var newData = qrData.copyWith(
      configuration: Configuration(
        enablePassword: enablePassword,
        enableScanLimit: enableScanLimit,
        password: enablePassword 
          ? pwController.trim() : null,
        scanLimit: enableScanLimit
          ? scanLimitController.trim() : null
      )
    );

    context.read<QrCodeBloc>().add(
      SaveQRConfigurationEvent(qrData: newData)
    );
  }

  @override
  dispose() {

  }
}