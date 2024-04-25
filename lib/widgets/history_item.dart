import 'package:flutter/material.dart';
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
  const HistoryItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: ()=>context.goto(Routes.preview, args: item),
      child: StyledWrapper(
        m: const EdgeInsets.only(bottom: 16),
        p: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            SizedBox(
              height: 60,
              width: 60,
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
            8.w(),
            const Icon(Icons.arrow_forward_ios_outlined, size: 16)
          ],
        )
      ),
    );
  }
}