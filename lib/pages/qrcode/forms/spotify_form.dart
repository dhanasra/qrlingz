import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/utils/validator.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

class SpotifyForm extends StatelessWidget {
  const SpotifyForm({super.key});

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
              Image.asset("res/images/spotify.png"),
              16.h(),
              "Mobile Number".ts(context),
              8.h(),
              TextFormField(
                controller: controller,
                validator: (v)=>Validator.validatePhoneNumber(v),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone_android_outlined),
                  hintText: "Enter mobile number here"
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
                  var data = controller.text;
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