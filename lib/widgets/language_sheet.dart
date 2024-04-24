import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrlingz_app/common/theme/theme_cubit.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';

import 'dialog_wrapper.dart';
import 'styled_button.dart';

class LanguageSheet extends StatefulWidget {
  final ValueChanged onSave;
  const LanguageSheet({super.key, required this.onSave});

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  late ThemeMode selectedTheme;

  @override
  void initState() {
    selectedTheme = context.read<ThemeCubit>().state;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DialogWrapper(
      onSubmit: (){}, 
      header: Image.asset("res/images/language.png"), 
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Change Theme".hs(context),
            16.h(),
            RadioListTile(
              value: ThemeMode.light,
              groupValue: selectedTheme,
              title: "English".tl(context),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (v){
                setState(() {
                  if(v!=null){
                    selectedTheme = v;
                  }
                });
              },
            ),
            RadioListTile(
              value: ThemeMode.dark,
              groupValue: selectedTheme,
              title: "தமிழ்".tl(context),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (v){
                setState(() {
                  if(v!=null){
                    selectedTheme = v;
                  }
                });
              },
            ),
            RadioListTile(
              value: ThemeMode.system,
              groupValue: selectedTheme,
              title: "हिंदी".tl(context),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (v){
                setState(() {
                  if(v!=null){
                    selectedTheme = v;
                  }
                });
              },
            ),
            RadioListTile(
              value: ThemeMode.system,
              groupValue: selectedTheme,
              title: "മലയാളം".tl(context),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (v){
                setState(() {
                  if(v!=null){
                    selectedTheme = v;
                  }
                });
              },
            ),
            RadioListTile(
              value: ThemeMode.system,
              groupValue: selectedTheme,
              title: "ಕನ್ನಡ".tl(context),
              controlAffinity: ListTileControlAffinity.trailing,
              onChanged: (v){
                setState(() {
                  if(v!=null){
                    selectedTheme = v;
                  }
                });
              },
            ),
            16.h(),
            Align(
              alignment: Alignment.center,
              child: StyledButton(
                w: 160,
                rounded: true,
                onClick: (){
                  context.back();
                  widget.onSave(selectedTheme);
                }, 
                text: "SAVE"
              )
            )
          ],
        ),
      )
    );
  }
}