import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qrlingz_app/constants/string_const.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/widgets/feedback_item.dart';

import '../constants/assets_const.dart';
import 'styled_button.dart';

class FeedbackList extends StatelessWidget {
  final List<QRData> feedbacks;
  final PageController controller;
  const FeedbackList({super.key, required this.feedbacks, required this.controller});

  @override
  Widget build(BuildContext context) {
    return feedbacks.isEmpty
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
            ...feedbacks.map(
              (e) => FeedbackItem(
                data: e, 
                onOptionClick: (value){

                },
                onClick: ()=>context.goto(Routes.barcodeView, args: e)
              ))
          ],
      );
  }
}