import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:qrlingz_app/constants/color_const.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/network/models/barcode_design.dart';

import '../constants/data_const.dart';
import '../utils/utils.dart';
import 'styled_wrapper.dart';

class BarcodePreview extends StatelessWidget {
  final String value;
  final String type;
  final BarcodeDesign design;
  const BarcodePreview({super.key, required this.value, required this.type, required this.design});

  @override
  Widget build(BuildContext context) {

    var barcodeColor = stringToColor( design.code?.color ??  design.color) ?? context.theme().textTheme.bodySmall!.color!;
    var outerRadius = (design.borderRadius ?? 32)/4;
    var border = design.border!=null 
      ? Border.all(width: design.border ?? 0, color: stringToColor(design.borderColor) ?? Colors.transparent) : null;

    var barcodeMargin = ( design.code?.padding ?? 0 )/4;
    var barcodeTextSize = design.code?.textSize!=null ? (design.code!.textSize!)/4 : null;
    var barcodeTextFont = design.code?.font!=null ? (DataConst.fontFamilies.firstWhere((element) => element["name"]==design.code!.font)["style"] as TextStyle).fontFamily : null;

    var contentFont = design.content?.font!=null ? (DataConst.fontFamilies.firstWhere((element) => element["name"]==design.content!.font)["style"] as TextStyle).fontFamily : null;
    var contentSize = design.content?.size!=null ? (design.content!.size!)/4 : null;

    var layout = design.content?.layout;
    var contentPosition = layout!=null && layout=="layout1"
      ? "top" : "bottom";


    return StyledWrapper(
      p: const EdgeInsets.all(20),
      g: ColorConst.gradients[design.background],
      r: outerRadius,
      border: border,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: design.content?.text!=null && design.content!.text!.isNotEmpty && contentPosition=="top",
            child: Text(design.content?.text??'',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: contentFont,
                color: stringToColor(design.content?.color),
                fontSize: contentSize
              )
            )
          ),
          BarcodeWidget(
            width: 200,
            height: 100,
            margin: EdgeInsets.all(barcodeMargin),
            backgroundColor: stringToColor(design.code?.backgroundColor),
            padding: const EdgeInsets.all(8),
            data: value, 
            style: TextStyle(
              fontFamily: barcodeTextFont,
              color: stringToColor(design.code?.textColor),
              fontSize: barcodeTextSize
            ),
            color: barcodeColor,
            drawText: design.code?.showText ?? true,
            barcode: getBarcodeType(type)
          ),
          Visibility(
            visible: design.content?.text!=null && design.content!.text!.isNotEmpty && contentPosition=="bottom",
            child: Text(design.content?.text??'',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: contentFont,
                color: stringToColor(design.content?.color),
                fontSize: contentSize
              )
            )
          )
        ],
      ),
    );
  }
}