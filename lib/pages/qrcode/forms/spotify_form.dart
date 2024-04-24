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
    final TextEditingController artistNameController = TextEditingController();
    final TextEditingController songNameController = TextEditingController();
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
              "Artist Name".ts(context),
              8.h(),
              TextFormField(
                controller: artistNameController,
                validator: (v)=>Validator.validateNonNullOrEmpty(v, "Artist name"),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outlined),
                  hintText: "Enter artist name here"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Song Name".ts(context),
              8.h(),
              TextFormField(
                controller: songNameController,
                validator: (v)=>Validator.validateNonNullOrEmpty(v, "Song name"),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.music_note_outlined),
                  hintText: "Enter song name here"
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
                  var data = "spotify:search:${songNameController.trim()}:${artistNameController.trim()}";
                  context.goto(Routes.customize, args: { "data": {"value": data}, "name": "Spotify" });
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