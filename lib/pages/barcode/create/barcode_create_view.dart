import 'package:barcode_widget/barcode_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/pages/barcode/create/barcode_create_viewmodel.dart';
import 'package:qrlingz_app/utils/utils.dart';

import '../../../constants/string_const.dart';
import '../../../utils/validator.dart';
import '../../../widgets/styled_button.dart';

class BarcodeCreateView extends StatefulWidget {
  final String type;
  const BarcodeCreateView({super.key, required this.type});

  @override
  State<BarcodeCreateView> createState() => _BarcodeCreateViewState();
}

class _BarcodeCreateViewState extends State<BarcodeCreateView> {

  late BarcodeCreateViewModel _viewModel;

  @override
  void initState() {
    _viewModel = BarcodeCreateViewModel(widget.type);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate Barcode").tr(),
        centerTitle: false,
      ),
      body: ValueListenableBuilder(
        valueListenable: _viewModel.mode,
        builder: (_, autoValidate, __) {
          return Form(
            key: _viewModel.formKey,
            autovalidateMode: autoValidate,
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
            
                    getLabel(widget.type).hm(context),
            
                    BarcodeWidget(
                      width: 100,
                      data: getBarcodeSampleData(widget.type), 
                      barcode: getBarcodeType(widget.type)
                    ),
                  ],
                ),
                16.h(),
                "Barcode Content".ts(context),
                8.h(),
                TextFormField(
                  controller: _viewModel.controller,
                  validator: (v)=>Validator.validateBarcodeContent(widget.type, v),
                  decoration: InputDecoration(
                    hintText: "Enter barcode content here".tr(),
                    helperText: getFormatInstructions(widget.type).tr()
                  ),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                32.h(),
                StyledButton(
                  onClick: ()=>_viewModel.saveBarcode(context), 
                  text: StringConst.create.toUpperCase()
                )
              ],
            ),
          );
        }
      ),
    );
  }
}