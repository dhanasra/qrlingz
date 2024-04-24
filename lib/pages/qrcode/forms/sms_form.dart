import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/utils/validator.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

class SmsForm extends StatelessWidget {
  const SmsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController numberController = TextEditingController();
    final TextEditingController messageController = TextEditingController();
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
              "Mobile Number".ts(context),
              8.h(),
              TextFormField(
                controller: numberController,
                validator: (v)=>Validator.validatePhoneNumber(v),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone_android_outlined),
                  hintText: "Enter mobile number here"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),  
               12.h(),
              "Messgae".ts(context),
              8.h(),
              TextFormField(
                controller: messageController,
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: "Enter message here"
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
                  var data = "smsto:${numberController.trim()}:${messageController.trim()}";
                  context.goto(Routes.customize, args: { "data": {"value": data}, "name": "SMS" });
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