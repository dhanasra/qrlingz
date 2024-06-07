import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/models/qr_data.dart';

import '../constants/color_const.dart';
import '../constants/string_const.dart';
import '../routes/app_routes.dart';
import '../utils/utils.dart';
import 'styled_wrapper.dart';

class FeedbackItem extends StatelessWidget {
  final QRData data;
  final VoidCallback onClick;
  final ValueChanged onOptionClick;
  const FeedbackItem({super.key, required this.data, required this.onClick, required this.onOptionClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>context.goto(Routes.preview, args: data),
      child: StyledWrapper(
        m: const EdgeInsets.only(bottom: 16),
        p: const EdgeInsets.fromLTRB(16, 12, 0, 12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  color: Colors.white,
                  padding: const EdgeInsets.all(4),
                  child: PrettyQrView.data(
                    data: data.data['value'],
                    errorCorrectLevel: 3,
                    decoration: PrettyQrDecoration(
                        shape: data.pixels?["type"]=="Rounded"
                        ? PrettyQrRoundedSymbol(
                          borderRadius: data.pixels?["corner"]=="Smooth" 
                            ? BorderRadius.circular(10)
                            : BorderRadius.circular(2),
                          color: PrettyQrBrush.gradient
                          (
                            gradient: data.color?["fgg"]!=null
                            ? ColorConst.gradients[data.color?["fgg"]]!
                            : LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: data.color?["fg"]!=null
                              ? [
                                stringToColor(data.color?["fg"])!,
                                stringToColor(data.color?["fg"])!
                              ]
                              : [
                                Colors.black, Colors.black
                              ],
                            ),
                          ),
                        )
                      : PrettyQrSmoothSymbol(
                        roundFactor: data.pixels?["corner"]=="Smooth" ? 1: 0,
                        color: PrettyQrBrush.gradient
                          (
                            gradient: data.color?["fgg"]!=null
                            ? ColorConst.gradients[data.color?["fgg"]]!
                            : LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: data.color?["fg"]!=null
                              ? [
                                stringToColor(data.color?["fg"])!,
                                stringToColor(data.color?["fg"])!
                              ]
                              : [
                                Colors.black, Colors.black
                              ],
                            ),
                          ),
                      ),
                      image: data.logo!=null
                      ? PrettyQrDecorationImage(
                        image: NetworkImage(data.logo!),
                        position: PrettyQrDecorationImagePosition.embedded,
                      )
                      : null
                    )
                  )
                ),
                12.w(),
                Expanded(
                  child: Column(
                    children: [
                  
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                data.name.tl(context, maxLines: 2),
                                4.h(),
                                Text('${data.data['value']}', maxLines: 2, overflow: TextOverflow.ellipsis,),
                              ],
                            )),
                        ],
                      ),
                  
                  
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 30,
                            child: OutlinedButton(
                              onPressed: ()=>context.goto(Routes.feedbackReview, args: data.data["id"]),
                              child: const Text("View Ratings"),
                            ),
                          ),

                          PopupMenuButton(
                            padding: EdgeInsets.fromLTRB( data.name=="Feedback" ? 0 :16, 10, 16, 10),
                            constraints: const BoxConstraints(
                              minWidth: 200
                            ),
                            onSelected: (v)=>onOptionClick({"data": data, "type": v}),
                            itemBuilder: (_){
                            return[
                              PopupMenuItem<String>(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                value: 'view',
                                child: Row(
                                  children: [
                                    const Icon(Icons.remove_red_eye_outlined, size: 20,),
                                    24.w(),
                                    StringConst.historyPop1.tl(context)
                                  ],
                                ),
                              ),
                              PopupMenuItem<String>(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                value: 'edit',
                                child: Row(
                                  children: [
                                    const Icon(Icons.edit_outlined, size: 20,),
                                    24.w(),
                                    StringConst.historyPop2.tl(context)
                                  ],
                                ),
                              ),
                              PopupMenuItem<String>(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                value: 'share',
                                child: Row(
                                  children: [
                                    const Icon(Icons.share_outlined, size: 20,),
                                    24.w(),
                                    StringConst.historyPop3.tl(context)
                                  ],
                                ),
                              ),
                              PopupMenuItem<String>(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                value: 'delete',
                                child: Row(
                                  children: [
                                    const Icon(Icons.delete_outlined, size: 20, color: Colors.red),
                                    24.w(),
                                    StringConst.historyPop4.tl(context, color: Colors.red)
                                  ],
                                ),
                              ),
                            ];
                          })
                        ],
                      )
                  
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}