import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/utils/validator.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

class EventForm extends StatelessWidget {
  const EventForm({super.key});

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
              "Event Name".ts(context),
              8.h(),
              TextFormField(
                controller: numberController,
                validator: (v)=>Validator.validatePhoneNumber(v),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.event_outlined),
                  hintText: "Enter event name here"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),  
               12.h(),
               "Location".ts(context),
              8.h(),
              TextFormField(
                controller: numberController,
                validator: (v)=>Validator.validatePhoneNumber(v),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.room_outlined),
                  hintText: "Enter location here"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ), 
               12.h(),
                "Start At".ts(context),
              8.h(),
              // showDatePicker(context: context, firstDate: firstDate, lastDate: lastDate)
              // TextFormField(
              //   controller: numberController,
              //   validator: (v)=>Validator.validatePhoneNumber(v),
              //   decoration: const InputDecoration(
              //     prefixIcon: Icon(Icons.room_outlined),
              //     hintText: "Enter location here"
              //   ),
              //   style: Theme.of(context).textTheme.titleMedium,
              // ), 
               12.h(),
                "End At".ts(context),
              8.h(),
              TextFormField(
                controller: numberController,
                validator: (v)=>Validator.validatePhoneNumber(v),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.room_outlined),
                  hintText: "Enter location here"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ), 
               12.h(),
              "Description".ts(context),
              8.h(),
              TextFormField(
                controller: messageController,
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: "Enter description here"
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
                  var data = numberController.text;
                  context.goto(Routes.customize, args: { "data": {"value": data}, "name": "Event" });
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