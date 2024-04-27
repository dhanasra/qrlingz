import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/utils/validator.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

import '../../../constants/string_const.dart';

class SocialForm extends StatelessWidget {
  final String type;
  final String name;
  final String image;
  const SocialForm({super.key, required this.type, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
    final ValueNotifier<AutovalidateMode> mode = ValueNotifier(AutovalidateMode.disabled);

    return ValueListenableBuilder(
      valueListenable: mode,
      builder: (_, value, __) {
        return Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image),
              16.h(),
              name.ts(context),
              8.h(),
              TextFormField(
                controller: controller,
                validator: (v)=>Validator.validateNonNullOrEmpty(v, name),
                decoration: InputDecoration(
                  prefixIcon: Icon(type=="username" ? Icons.edit_outlined: Icons.link_outlined),
                  hintText: type=="username" 
                    ? "Enter ${name.toLowerCase()} username here" 
                    : "Enter ${name.toLowerCase()} profile link here" 
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              32.h(),
              StyledButton(
                onClick: (){
                  if(!formKey.currentState!.validate()){
                    mode.value = AutovalidateMode.always;
                    return;
                  }

                  var data = "";
                  var app = name.toLowerCase();

                  switch(app){
                    case "instagram": data = "https://www.instagram.com/${controller.trim()}";
                    case "x": data = "https://twitter.com/${controller.trim()}";
                    case "snapchat": data = "https://www.snapchat.com/add/${controller.trim()}";
                    case "paypal": data = "https://www.paypal.me/${controller.trim()}";
                    case "pinterest": data = "https://www.pinterest.com/${controller.trim()}";
                    case "tiktok" || "linkedin" || "wechat" || "line": data = controller.trim();
                  }

                  context.goto(Routes.customize, args: { 
                    "data": {
                      "value": data,
                      "text": controller.trim()
                    }, 
                    "name": name 
                  });
                }, 
                text: StringConst.create.toUpperCase()
              )
            ],
          ),
        );
      }
    );
  }
}