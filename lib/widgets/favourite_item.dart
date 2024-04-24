import 'package:flutter/material.dart';
import 'package:qrlingz_app/constants/color_const.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/widgets/styled_wrapper.dart';

class FavouriteItem extends StatelessWidget {
  final QRData item;
  const FavouriteItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {

    return StyledWrapper(
      m: const EdgeInsets.only(bottom: 16),
      p: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: item.icon!=null
              ? ColorConst.primary : Colors.white,
            child: item.icon!=null
              ? Icon(item.icon, size: 24, color: Colors.white)
              : Image.asset(item.image??'', width: 45),
          ),
          12.w(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                '${item.data['value']}'.tl(context),
                4.h(),
                Text(item.name)
              ],
            )),
          const Icon(Icons.arrow_forward_ios_outlined, size: 16)
        ],
      )
    );
  }
}