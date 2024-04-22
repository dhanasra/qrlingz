import 'package:flutter/material.dart';
import 'package:qrlingz_app/widgets/history_item.dart';

import '../../../constants/data_const.dart';
import '../../../models/qr_data.dart';

class HistoryFragment extends StatelessWidget {
  const HistoryFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        ...DataConst.sampleData.map((e) => HistoryItem(item: QRData.fromMap(e)))
      ],
    );
  }
}