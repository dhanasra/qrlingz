import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/pages/scan/data/scan_data_viewmodel.dart';

class ScanDataView extends StatefulWidget {
  final QRData data;
  const ScanDataView({super.key, required this.data});

  @override
  State<ScanDataView> createState() => _ScanDataViewState();
}

class _ScanDataViewState extends State<ScanDataView> {
  late ScanDataViewModel _viewModel;

  @override
  void initState() {
    _viewModel = ScanDataViewModel(qr: widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_viewModel.qr.name)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(offset: Offset(-3, -3), color: Color(0x88DFDFDF), blurRadius: 10),
                  BoxShadow(offset: Offset(3, 3), color: Color(0x88DFDFDF), blurRadius: 10)
                ]
              ),
              child: "${_viewModel.qr.data['value']}".tl(context),
            ),
            16.h(),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(offset: Offset(-3, -3), color: Color(0x88DFDFDF), blurRadius: 10),
                  BoxShadow(offset: Offset(3, 3), color: Color(0x88DFDFDF), blurRadius: 10)
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60,
                    child: Column(
                      children: [
                        const Icon(Icons.language),
                        4.h(),
                        "Open".ts(context)
                      ],
                    ),
                  ),
                  24.w(),
                  InkWell(
                    onTap: ()=>_viewModel.copyCode(context),
                    child: SizedBox(
                      width: 60,
                      child: Column(
                        children: [
                          const Icon(Icons.copy_outlined),
                          4.h(),
                          "Copy".ts(context)
                        ],
                      ),
                    ),
                  ),
                  24.w(),
                  InkWell(
                    onTap: ()=>_viewModel.shareCode(),
                    child: SizedBox(
                      width: 60,
                      child: Column(
                        children: [
                          const Icon(Icons.share_outlined),
                          4.h(),
                          "Share".ts(context)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            16.h(),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(offset: Offset(-3, -3), color: Color(0x88DFDFDF), blurRadius: 10),
                  BoxShadow(offset: Offset(3, 3), color: Color(0x88DFDFDF), blurRadius: 10)
                ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("res/images/theme.png", width: 50),
                  "Decorate Code".tl(context),
                  const Icon(Icons.arrow_forward)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}