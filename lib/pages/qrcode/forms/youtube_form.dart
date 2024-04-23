import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/utils/validator.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

import '../../../widgets/single_select.dart';

class YoutubeForm extends StatelessWidget {
  const YoutubeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController videoIdController = TextEditingController();
    final TextEditingController channelIdController = TextEditingController();
    final TextEditingController urlController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
    final ValueNotifier<AutovalidateMode> mode = ValueNotifier(AutovalidateMode.disabled);
    final ValueNotifier<String> type = ValueNotifier("Video ID");

    return ValueListenableBuilder(
      valueListenable: mode,
      builder: (_, value, __) {
        return Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("res/images/youtube.png"),
              16.h(),
              "Type".ts(context),
              8.h(),
              SingleSelect(
                items: const [
                  "Video ID", "Channel ID", "URL"
                ], 
                value: "Video ID",
                onChanged: (v){
                  type.value = v;
                },
              ),
              12.h(),
              ValueListenableBuilder(
                valueListenable: type, 
                builder: (_, value, __){
                  return value=="Video ID"
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Video ID".ts(context),
                      8.h(),
                      TextFormField(
                        controller: videoIdController,
                        validator: (v)=>Validator.validateNonNullOrEmpty(v, "Video Id"),
                        decoration: const InputDecoration(
                          hintText: "Enter youtube video id here" 
                        ),
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  )
                  : value=="Channel ID"
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Channel ID".ts(context),
                      8.h(),
                      TextFormField(
                        controller: channelIdController,
                        validator: (v)=>Validator.validateNonNullOrEmpty(v, "Channel Id"),
                        decoration: const InputDecoration(
                          hintText: "Enter youtube channel id here" 
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
                        validator: (v)=>Validator.isValidURL(v, "URL"),
                        decoration: const InputDecoration(
                          hintText: "Enter youtube url here" 
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
                  var data = type.value == "Video ID" 
                  ? "https://www.youtube.com/watch?v=${videoIdController.trim()}"
                  : type.value == "Channel ID" 
                  ? "https://www.youtube.com/${channelIdController.trim()}"
                  : urlController.trim();
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