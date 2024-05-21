import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/network/models/barcode_design.dart';
import 'package:qrlingz_app/pages/barcode/bloc/barcode_bloc.dart';

class BarcodeCustomizeViewModel extends BaseViewModel {
  late ValueNotifier<BarcodeDesign> design;
  late String barcodeType;
  late String barcodeData;
  late TextEditingController content;
  
  BarcodeCustomizeViewModel(Map data, String name){
    barcodeData = data['value'];
    barcodeType = name;
    design = ValueNotifier(BarcodeDesign());
    content = TextEditingController();
  }

  saveBarcode(BuildContext context){

    context.read<BarcodeBloc>().add(
      SaveBarcodeEvent(design: design.value, name: barcodeType, value: barcodeData)
    );
  }

  @override
  dispose() {

  }
}