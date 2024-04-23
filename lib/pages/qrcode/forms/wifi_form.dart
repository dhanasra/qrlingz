import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/utils/validator.dart';
import 'package:qrlingz_app/widgets/single_select.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

class WifiForm extends StatelessWidget {
  const WifiForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    var security = "";
    final GlobalKey<FormState> formKey = GlobalKey();
    final ValueNotifier<AutovalidateMode> mode = ValueNotifier(AutovalidateMode.disabled);
    final ValueNotifier<bool> passwordVisible = ValueNotifier(false);

    return ValueListenableBuilder(
      valueListenable: mode,
      builder: (_, value, __) {
        return Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Network name (SSID)".ts(context),
              8.h(),
              TextFormField(
                controller: nameController,
                validator: (v)=>Validator.validateNonNullOrEmpty(v,"Network name"),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.wifi_outlined),
                  hintText: "Enter network name"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Security".ts(context),
              8.h(),
              SingleSelect(
                items: const [
                  "WPA/WPA2", "WEP", "None"
                ], 
                value: "WPA/WPA2",
                onChanged: (v){
                  security = v;
                },
              ),
              12.h(),
              "Password".ts(context),
              8.h(),
              ValueListenableBuilder(
                valueListenable: passwordVisible,
                builder: (_, value, __) {
                  return TextFormField(
                    controller: passwordController,
                    validator: (v)=>Validator.validateNonNullOrEmpty(v,"Password"),
                    obscureText: !value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outlined),
                      hintText: "Enter password",
                      suffixIcon: IconButton(
                        onPressed: ()=>passwordVisible.value = !passwordVisible.value, 
                        icon: Icon(passwordVisible.value ? Icons.remove_red_eye: Icons.remove_red_eye_outlined))
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                  );
                }
              ),
              32.h(),
              StyledButton(
                onClick: (){
                  if(!formKey.currentState!.validate()){
                    mode.value = AutovalidateMode.always;
                    return;
                  }
                  var data = nameController.text;
                  context.goto(Routes.customize, args: data);
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