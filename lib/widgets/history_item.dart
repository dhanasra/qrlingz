import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/widgets/styled_wrapper.dart';

import '../constants/color_const.dart';
import '../utils/utils.dart';

class HistoryItem extends StatelessWidget {
  final QRData item;
  final ValueChanged onOptionClick;
  const HistoryItem({super.key, required this.item,  required this.onOptionClick});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: ()=>context.goto(Routes.preview, args: item),
      child: StyledWrapper(
        m: const EdgeInsets.only(bottom: 16),
        p: const EdgeInsets.fromLTRB(16, 12, 0, 12),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              color: Colors.white,
              padding: const EdgeInsets.all(4),
              child: PrettyQrView.data(
                data: item.data['value'],
                errorCorrectLevel: 3,
                decoration: PrettyQrDecoration(
                    shape: item.pixels?["type"]=="Rounded"
                    ? PrettyQrRoundedSymbol(
                      borderRadius: item.pixels?["corner"]=="Smooth" 
                        ? BorderRadius.circular(10)
                        : BorderRadius.circular(2),
                      color: PrettyQrBrush.gradient
                      (
                        gradient: item.color?["fgg"]!=null
                        ? ColorConst.gradients[item.color?["fgg"]]!
                        : LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: item.color?["fg"]!=null
                          ? [
                            stringToColor(item.color?["fg"])!,
                            stringToColor(item.color?["fg"])!
                          ]
                          : [
                            Colors.black, Colors.black
                          ],
                        ),
                      ),
                    )
                  : PrettyQrSmoothSymbol(
                    roundFactor: item.pixels?["corner"]=="Smooth" ? 1: 0,
                    color: PrettyQrBrush.gradient
                      (
                        gradient: item.color?["fgg"]!=null
                        ? ColorConst.gradients[item.color?["fgg"]]!
                        : LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: item.color?["fg"]!=null
                          ? [
                            stringToColor(item.color?["fg"])!,
                            stringToColor(item.color?["fg"])!
                          ]
                          : [
                            Colors.black, Colors.black
                          ],
                        ),
                      ),
                  ),
                  image: item.logo!=null
                  ? PrettyQrDecorationImage(
                    image: NetworkImage(item.logo!),
                    position: PrettyQrDecorationImagePosition.embedded,
                  )
                  : null
                )
              )
            ),
            12.w(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  item.name.tl(context, maxLines: 2),
                  4.h(),
                  Text('${item.data['value']}', maxLines: 2, overflow: TextOverflow.ellipsis,),
                ],
              )),
            6.w(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).colorScheme.tertiary
              ),
              child: (item.type==0 ? "Generated" : "Scanned").ls(context)),
            PopupMenuButton(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              constraints: const BoxConstraints(
                minWidth: 200
              ),
              onSelected: (v)=>onOptionClick({"data": item, "type": v}),
              itemBuilder: (_){
              return[
                PopupMenuItem<String>(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  value: 'view',
                  child: Row(
                    children: [
                      const Icon(Icons.remove_red_eye_outlined, size: 20,),
                      24.w(),
                      'Show Preview'.ts(context)
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'edit',
                  child: Row(
                    children: [
                      const Icon(Icons.edit_outlined, size: 20,),
                      24.w(),
                      'Decorate QR'.ts(context)
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'share',
                  child: Row(
                    children: [
                      const Icon(Icons.share_outlined, size: 20,),
                      24.w(),
                      'Share Now'.ts(context)
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'delete',
                  child: Row(
                    children: [
                      const Icon(Icons.delete_outlined, size: 20, color: Colors.red),
                      24.w(),
                      'Delete Forever'.ts(context, color: Colors.red)
                    ],
                  ),
                ),
              ];
            })
          ],
        )
      ),
    );
  }
}