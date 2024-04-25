import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/utils/validator.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

import '../../../widgets/single_select.dart';

class FacebookForm extends StatelessWidget {
  const FacebookForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController facebookIdController = TextEditingController();
    final TextEditingController urlController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
    final ValueNotifier<AutovalidateMode> mode = ValueNotifier(AutovalidateMode.disabled);
    final ValueNotifier<String> type = ValueNotifier("Facebook ID");

    return ValueListenableBuilder(
      valueListenable: mode,
      builder: (_, value, __) {
        return Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("res/images/facebook.png"),
              16.h(),
              "Type".ts(context),
              8.h(),
              SingleSelect(
                items: const [
                  "Facebook ID", "URL"
                ], 
                value: "Facebook ID",
                onChanged: (v){
                  type.value = v;
                },
              ),
              12.h(),
              ValueListenableBuilder(
                valueListenable: type, 
                builder: (_, value, __){
                  return value=="Facebook ID"
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Facebook ID".ts(context),
                      8.h(),
                      TextFormField(
                        controller: facebookIdController,
                        validator: (v)=>Validator.validateNonNullOrEmpty(v, "Facebook Id"),
                        decoration: const InputDecoration(
                          hintText: "Enter facebook id here" 
                        ),
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  )
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "URL".ts(context),
                      8.h(),
                      TextFormField(
                        controller: urlController,
                        validator: (v)=>Validator.isValidURL(v, "Facebook url"),
                        decoration: const InputDecoration(
                          hintText: "Enter facebook url here" 
                        ),
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  );
                }),
              32.h(),
              StyledButton(
                onClick: (){
                  if(!formKey.currentState!.validate()){
                    mode.value = AutovalidateMode.always;
                    return;
                  }
                  var data = type.value=="URL"
                  ? urlController.trim(): "https://www.facebook.com/${facebookIdController.trim()}";
                  context.goto(Routes.customize, args: { 
                    "data": {
                      "value": data,
                      "type": type.value,
                      "url": urlController.trim(),
                      "id": facebookIdController.trim()
                    }, 
                    "name": "Facebook" 
                  });
                }, 
                text: "CREATE"
              )
            ],
          ),
        );
      }
    );
  }
}