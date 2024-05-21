import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/models/qr_data.dart';

import '../constants/assets_const.dart';
import '../constants/string_const.dart';
import 'history_item.dart';
import 'styled_button.dart';

class QRCodesList extends StatelessWidget {
  final List<QRData> qrdata;
  final PageController controller;
  final ValueChanged onOptionClick;
  const QRCodesList({super.key, required this.qrdata, required this.controller, required this.onOptionClick});

  @override
  Widget build(BuildContext context) {
    return qrdata.isEmpty
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
      : ListView(
          padding: const EdgeInsets.all(20),
          children:  [
            ...qrdata.map(
              (e) => HistoryItem(item: e, onOptionClick: onOptionClick))
          ],
      );
  }
}