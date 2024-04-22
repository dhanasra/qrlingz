import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/widgets/styled_wrapper.dart';

class HistoryItem extends StatelessWidget {
  final QRData item;
  const HistoryItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {

    return StyledWrapper(
      m: const EdgeInsets.only(bottom: 16),
      p: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: PrettyQrView(
              qrImage: QrImage(
                QrCode.fromData(data: "",errorCorrectLevel: QrErrorCorrectLevel.H))
            ),
          ),
          12.w(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                '${item.data['value']}'.tl(context),
                4.h(),
                Text(item.name),
              ],
            )),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).colorScheme.tertiary
            ),
            child: (item.type==0 ? "Generated" : "Scanned").ls(context)),
          12.w(),
          const Icon(Icons.arrow_forward_ios_outlined, size: 16)
        ],
      )
    );
  }
}