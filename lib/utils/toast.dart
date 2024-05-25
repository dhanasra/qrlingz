import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

import '../widgets/styled_wrapper.dart';

class Toast {

  static show(BuildContext context, {required String message, String type = "success", VoidCallback? onOk}){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        content: StyledWrapper(
          p: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset("res/images/$type.png", width: 32,),
                  16.w(),
                  Expanded(child: message.tl(context, color: type=="success" 
                    ? Colors.green: type=="error" ? Colors.red : Colors.deepOrange)),
                  
                  Visibility(
                    visible: onOk!=null,
                    child: StyledButton(
                      w: 65,
                      h: 35,
                      isSmall: true,
                      onClick: onOk??(){},
                      text: "VIEW"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}