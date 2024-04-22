import 'package:flutter/material.dart';
import 'package:qrlingz_app/constants/data_const.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/widgets/favourite_item.dart';

class FavouritesFragment extends StatelessWidget {
  const FavouritesFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        ...DataConst.sampleData.map((e) => FavouriteItem(item: QRData.fromMap(e)))
      ],
    );
  }
}