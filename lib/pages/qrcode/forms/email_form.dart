import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/utils/validator.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

class EmailForm extends StatelessWidget {
  const EmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController mailController = TextEditingController();
    final TextEditingController subjectController = TextEditingController();
    final TextEditingController contentController = TextEditingController();
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
              "Email Address".ts(context),
              8.h(),
              TextFormField(
                controller: mailController,
                validator: (v)=>Validator.validateEmail(v),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: "Enter email address here"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Subject".ts(context),
              8.h(),
              TextFormField(
                controller: subjectController,
                decoration: const InputDecoration(
                  hintText: "Enter subject here"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Content".ts(context),
              8.h(),
              TextFormField(
                controller: contentController,
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: "Enter content here"
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
                  var data = "mailto:${mailController.trim()}?subject=${subjectController.trim()}&body=${contentController.trim()}";
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