import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/pages/barcode/customize/barcode_customize_viewmodel.dart';
import 'package:qrlingz_app/pages/barcode/customize/fragments/barcode_fragment.dart';
import 'package:qrlingz_app/pages/barcode/customize/fragments/content_fragment.dart';
import 'package:qrlingz_app/widgets/barcode_preview.dart';

import '../../../widgets/styled_button.dart';
import 'fragments/theme_fragment.dart';

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
            flex: 4,
            child: ValueListenableBuilder(
              valueListenable: _viewModel.design,
              builder: (_, design, __) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.grey,
                  child: BarcodePreview(
                    value: _viewModel.barcodeData, 
                    type: _viewModel.barcodeType, 
                    design: design
                  ),
                );
              }
            ),
          ),
          Expanded(
            flex: 6,
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  const TabBar(tabs: [
                    Tab(text: "Theme"),
                    Tab(text: "Barcode"),
                    Tab(text: "Content")
                  ]),
                  Expanded(
                    flex: 4,
                    child: TabBarView(children: [
                      ThemeFragment(vm: _viewModel),
                      BarcodeFragment(vm: _viewModel),
                      ContentFragment(vm: _viewModel)
                    ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}