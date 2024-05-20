import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/pages/barcode/customize/barcode_customize_viewmodel.dart';
import 'package:qrlingz_app/utils/utils.dart';
import 'package:qrlingz_app/widgets/styled_wrapper.dart';

import '../../../widgets/styled_button.dart';

class BarcodeCustomizeView extends StatefulWidget {
  final Map data;
  final String name;
  const BarcodeCustomizeView({super.key, required this.data, required this.name});

  @override
  State<BarcodeCustomizeView> createState() => _BarcodeCustomizeViewState();
}

class _BarcodeCustomizeViewState extends State<BarcodeCustomizeView> {
  late BarcodeCustomizeViewModel _viewModel;

  @override
  void initState() {
    _viewModel = BarcodeCustomizeViewModel(widget.data, widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customize Barcode"),
        centerTitle: false,
        actions: [
          SizedBox(
            width: 92,
            height: 36,
            child: StyledButton(
              onClick: () => {},
              text: "SAVE")
          ),
          16.w()
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.grey,
              child: StyledWrapper(
                p: const EdgeInsets.all(30),
                child: BarcodeWidget(
                  width: 200,
                  height: 100,
                  padding: const EdgeInsets.all(8),
                  data: _viewModel.barcodeData, 
                  barcode: getBarcodeType(_viewModel.barcodeType)
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(),
          )
        ],
      ),
    );
  }
}