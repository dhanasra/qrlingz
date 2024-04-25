import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/utils/validator.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

class TextForm extends StatelessWidget {
  const TextForm({super.key});

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
              "Text".ts(context),
              8.h(),
              TextFormField(
                controller: controller,
                maxLines: 5,
                validator: (v)=>Validator.validateNonNullOrEmpty(v,"Text"),
                decoration: const InputDecoration(
                  hintText: "Enter text here",
                  helperText: "* QR code may be difficult to recognize when content exceeds 100 chars"
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
                  context.goto(Routes.customize, args: { 
                    "data": {
                      "value": data
                    }, 
                    "name": "Text" 
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