import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';

import 'dialog_wrapper.dart';
import 'styled_button.dart';

class LanguageSheet extends StatefulWidget {
  final String value;
  final ValueChanged onSaved;
  const LanguageSheet({super.key, required this.value, required this.onSaved});

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  late String selectedLanguage;

  @override
  void initState() {
    selectedLanguage = widget.value;
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
            SizedBox(
              height: 300,
              child: ListView(
                children: [
                  RadioListTile(
                    value: "en",
                    groupValue: selectedLanguage,
                    title: "English".tl(context),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (v){
                      setState(() {
                        if(v!=null){
                          selectedLanguage = v;
                        }
                      });
                    },
                  ),
                  RadioListTile(
                    value: "ta",
                    groupValue: selectedLanguage,
                    title: "தமிழ்".tl(context),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (v){
                      setState(() {
                        if(v!=null){
                          selectedLanguage = v;
                        }
                      });
                    },
                  ),
                  RadioListTile(
                    value: "hi",
                    groupValue: selectedLanguage,
                    title: "हिंदी".tl(context),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (v){
                      setState(() {
                        if(v!=null){
                          selectedLanguage = v;
                        }
                      });
                    },
                  ),
                  RadioListTile(
                    value: "ml",
                    groupValue: selectedLanguage,
                    title: "മലയാളം".tl(context),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (v){
                      setState(() {
                        if(v!=null){
                          selectedLanguage = v;
                        }
                      });
                    },
                  ),
                  RadioListTile(
                    value: "kn",
                    groupValue: selectedLanguage,
                    title: "ಕನ್ನಡ".tl(context),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (v){
                      setState(() {
                        if(v!=null){
                          selectedLanguage = v;
                        }
                      });
                    },
                  ),
                  RadioListTile(
                    value: "bn",
                    groupValue: selectedLanguage,
                    title: "বাংলা".tl(context),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (v){
                      setState(() {
                        if(v!=null){
                          selectedLanguage = v;
                        }
                      });
                    },
                  ),
                  RadioListTile(
                    value: "pt",
                    groupValue: selectedLanguage,
                    title: "Português".tl(context),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (v){
                      setState(() {
                        if(v!=null){
                          selectedLanguage = v;
                        }
                      });
                    },
                  ),
                  RadioListTile(
                    value: "ur",
                    groupValue: selectedLanguage,
                    title: "اردو".tl(context),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (v){
                      setState(() {
                        if(v!=null){
                          selectedLanguage = v;
                        }
                      });
                    },
                  ),
                  RadioListTile(
                    value: "ar",
                    groupValue: selectedLanguage,
                    title: "العربية".tl(context),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (v){
                      setState(() {
                        if(v!=null){
                          selectedLanguage = v;
                        }
                      });
                    },
                  ),
                  RadioListTile(
                    value: "my",
                    groupValue: selectedLanguage,
                    title: "မြန်မာ".tl(context),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (v){
                      setState(() {
                        if(v!=null){
                          selectedLanguage = v;
                        }
                      });
                    },
                  ),
                  RadioListTile(
                    value: "gu",
                    groupValue: selectedLanguage,
                    title: "ગુજરાતી".tl(context),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (v){
                      setState(() {
                        if(v!=null){
                          selectedLanguage = v;
                        }
                      });
                    },
                  ),
                  RadioListTile(
                    value: "fr",
                    groupValue: selectedLanguage,
                    title: "Français".tl(context),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (v){
                      setState(() {
                        if(v!=null){
                          selectedLanguage = v;
                        }
                      });
                    },
                  ),
                  RadioListTile(
                    value: "de",
                    groupValue: selectedLanguage,
                    title: "Deutsch".tl(context),
                    controlAffinity: ListTileControlAffinity.trailing,
                    onChanged: (v){
                      setState(() {
                        if(v!=null){
                          selectedLanguage = v;
                        }
                      });
                    },
                  )
                ],
              ),
            ),
            16.h(),
            Align(
              alignment: Alignment.center,
              child: StyledButton(
                w: 160,
                rounded: true,
                onClick: (){
                  context.back();
                  widget.onSaved(selectedLanguage);
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