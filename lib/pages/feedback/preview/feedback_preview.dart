import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/network/models/feedback_data.dart';
import 'package:qrlingz_app/utils/utils.dart';

import '../../../constants/color_const.dart';

class FeebackPreview extends StatelessWidget {
  final FeedbackData data;
  const FeebackPreview({super.key, required this.data});

  @override
  Widget build(BuildContext context) {

    var headerColor = stringToColor(data.design?.theme?.header) ?? Colors.green;
    var background = data.design?.theme?.background !=null 
      ? ColorConst.gradients[data.design?.theme?.background]! : null;

    double borderRadius = data.design?.theme?.corner !=null
      ? data.design!.theme!.corner!/3 : 8;

    var borderColor = stringToColor(data.design?.theme?.borderColor) ?? Colors.transparent;
    double borderWidth = data.design?.theme?.border !=null
      ? data.design!.theme!.border!/10 : 0; 

    var nameColor = stringToColor(data.design?.content?.companyColor);
    var titleColor = stringToColor(data.design?.content?.titleColor);
    var descColor = stringToColor(data.design?.content?.descColor);
    var categoryColor = stringToColor(data.design?.content?.categoryColor);
    var iconColor = stringToColor(data.design?.content?.iconColor);
    var showNav = data.design?.content?.showNav ?? true;

    return Container(
      width: double.infinity,
      height: 500,
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!, width: 3),
        gradient: background,
      ),
      child: Stack(
        children: [

          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              color: headerColor
            ),
            child: Center(
              child: data.company.hm(context, color: nameColor ?? Colors.white),
            ),
          ),

          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                border: Border.all(
                  color: borderColor, 
                  width: borderWidth
                ),
                boxShadow: [
                  BoxShadow(offset: const Offset(-3, -3), color: Theme.of(context).shadowColor, blurRadius: 10),
                  BoxShadow(offset: const Offset(3, 3), color: Theme.of(context).shadowColor, blurRadius: 10)
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  data.title?.tl(context, color: titleColor),
                  Divider(color: Colors.grey.withOpacity(0.1)),
                  data.description?.ls(context, color: descColor ?? Colors.grey, bold: false),

                  16.h(),

                  ...data.categories.map((e) => 
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFAFAFAF).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: e.name.bs(context, color: categoryColor, align: TextAlign.start),
                          ),
                          Visibility(
                            visible: showNav,
                            child: Icon(Icons.arrow_forward_ios_outlined, size: 12, color: iconColor))
                        ],
                      ))
                  )

                ],
              ),
            ),
          ),

          const Positioned(
            right: 20,
            top: 20,
            child: Icon(Icons.edit_square, color: Colors.white)),

          if(data.websiteUrl!=null)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(data.websiteUrl??'', style: const TextStyle(fontSize: 12))
            ),
          )
        ]
      )
    );
  }
}