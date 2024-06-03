import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';

class CustomStepper extends StatelessWidget {
  final int activeIndex;
  final Function(int index) onClick;
  const CustomStepper({
    super.key,
    required this.activeIndex,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEFEFEF),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
      
          Expanded(
            child: InkWell(
              onTap: ()=>onClick(0),
              child: "STEP 1".ts(context, align: TextAlign.center),
            )
          ),
      
          Icon(
            Icons.keyboard_double_arrow_right_outlined,
            color: activeIndex<=0 ? context.theme().disabledColor : null,
          ),
      
          Expanded(
            child: InkWell(
              onTap: activeIndex>0 ? ()=>onClick(1) : null,
              child: activeIndex>0
              ? "STEP 2".ts(context, align: TextAlign.center)
              : "STEP 2".bs(context, align: TextAlign.center, color: context.theme().disabledColor),
            )
          ),
      
          Icon(
            Icons.keyboard_double_arrow_right_outlined,
            color: activeIndex<=1 ? context.theme().disabledColor : null,
          ),
      
          Expanded(
            child: InkWell(
              onTap:  activeIndex>1 ? ()=>onClick(2) : null,
              child: activeIndex>1
              ? "STEP 3".ts(context, align: TextAlign.center)
              : "STEP 3".bs(context, align: TextAlign.center, color: context.theme().disabledColor),
            )
          ),
      
        ],
      ),
    );
  }
}