import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/network/models/barcode_data.dart';
import 'package:qrlingz_app/routes/app_routes.dart';

import 'barcode_data_viewmodel.dart';

class BarcodeDataView extends StatefulWidget {
  final BarcodeData data;
  final File? image;
  const BarcodeDataView({super.key, required this.data, this.image});

  @override
  State<BarcodeDataView> createState() => _BarcodeDataViewState();
}

class _BarcodeDataViewState extends State<BarcodeDataView> {
  late BarcodeDataViewModel _viewModel;

  @override
  void initState() {
    _viewModel = BarcodeDataViewModel(context: context, barcode: widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Barcode"),
        actions: [
          IconButton(
            icon: const Icon(Icons.home_outlined),
            onPressed: ()=>context.goto(Routes.home, clear: true)
          ),
          16.w()
        ],
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
              child: _viewModel.barcode.value.tl(context),
            ),
            16.h(),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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
                  InkWell(
                    onTap: ()=>_viewModel.searchInWeb(context),
                    child: SizedBox(
                      width: 80,
                      child: Column(
                        children: [
                          const Icon(Icons.search_outlined),
                          4.h(),
                          "Search".ts(context)
                        ],
                      ),
                    ),
                  ),
                   InkWell(
                    onTap: ()=>_viewModel.copyCode(context),
                    child: SizedBox(
                      width: 80,
                      child: Column(
                        children: [
                          const Icon(Icons.copy_outlined),
                          4.h(),
                          "Copy".ts(context)
                        ],
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: ()=>_viewModel.shareCode(),
                    child: SizedBox(
                      width: 80,
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
            // InkWell(
            //   onTap: ()=>context.goto(Routes.barcodeCustomize, args: { 
            //     "data": {
            //       "value": _viewModel.barcode.value,
            //     }, 
            //     "name": _viewModel.barcode.type
            //   }),
            //   child: Container(
            //     alignment: Alignment.center,
            //     padding: const EdgeInsets.all(20),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(8),
            //       boxShadow: const [
            //         BoxShadow(offset: Offset(-3, -3), color: Color(0x88DFDFDF), blurRadius: 10),
            //         BoxShadow(offset: Offset(3, 3), color: Color(0x88DFDFDF), blurRadius: 10)
            //       ]
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Image.asset("res/images/theme.png", width: 50),
            //         "Decorate Code".tl(context),
            //         const Icon(Icons.arrow_forward)
            //       ],
            //     ),
            //   ),
            // ),
            16.h(),
            if(widget.image!=null)
            Expanded(
              child: Image.file(widget.image!, fit: BoxFit.contain),
            )
          ],
        ),
      ),
    );
  }
}