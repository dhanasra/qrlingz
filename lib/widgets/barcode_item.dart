import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/network/models/barcode_data.dart';

import '../utils/utils.dart';
import 'styled_wrapper.dart';

class BarcodeItem extends StatelessWidget {
  final BarcodeData data;
  final VoidCallback onClick;
  const BarcodeItem({super.key, required this.data, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onClick(),
      child: StyledWrapper(
        p: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BarcodeWidget(
              padding: const EdgeInsets.all(8),
              data: data.value, 
              barcode: getBarcodeType(data.name)
            ),
            4.h(),
            getLabel(data.name).ts(context),
            4.h(),
            data.value.bs(context, color: Colors.grey, align: TextAlign.center)
          ],
        ),
      ),
    );
  }
}