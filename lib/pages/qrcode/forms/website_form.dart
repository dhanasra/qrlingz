import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/utils/validator.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

class WebsiteForm extends StatelessWidget {
  const WebsiteForm({super.key});

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
              "Website".ts(context),
              8.h(),
              TextFormField(
                controller: controller,
                validator: (v)=>Validator.isValidURL(v,"Website"),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.link),
                  hintText: "Enter link here"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              Wrap(
                spacing: 12,
                children: ["https://", "http://", ".com"].map(
                  (e) => InkWell(
                    onTap: ()=>controller.text = "${controller.text}$e",
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).colorScheme.tertiary,
                        boxShadow: const [
                          BoxShadow(offset: Offset(-3, -3), color: Color(0x88DFDFDF), blurRadius: 10),
                          BoxShadow(offset: Offset(3, 3), color: Color(0x88DFDFDF), blurRadius: 10)
                        ]
                      ),
                      child: Text(e),
                    ),
                  )).toList(),
              ),
              32.h(),
              StyledButton(
                onClick: (){
                  if(!formKey.currentState!.validate()){
                    mode.value = AutovalidateMode.always;
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