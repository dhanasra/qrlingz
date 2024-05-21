import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qrlingz_app/constants/string_const.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/network/models/barcode_data.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/widgets/barcode_item.dart';

import '../constants/assets_const.dart';
import 'styled_button.dart';

class BarcodesList extends StatelessWidget {
  final List<BarcodeData> barcodes;
  final PageController controller;
  const BarcodesList({super.key, required this.barcodes, required this.controller});

  @override
  Widget build(BuildContext context) {
    return barcodes.isEmpty
      ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(AssetsConst.notfound, width: 300),
              24.h(),
              StringConst.noHistoryTitle.hm(context, align: TextAlign.center),
              8.h(),
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 250
                ),
                child: StringConst.noHistorySub.ts(
                  context, align: TextAlign.center, color: Colors.grey),  
              ),
              32.h(),
              StyledButton(
                w: 160,
                rounded: true,
                onClick: ()=>controller.jumpTo(0),
                text: StringConst.create,
              )
            ],
          )
      : GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1
          ),
          children:  [
            ...barcodes.map(
              (e) => BarcodeItem(
                data: e, 
                onClick: ()=>context.goto(Routes.barcodeView, args: e)
              ))
          ],
      );
  }
}