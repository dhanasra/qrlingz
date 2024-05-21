import 'package:flutter/material.dart';

class Switcher extends StatelessWidget {
  final bool value;
  final ValueChanged onChanged;
  const Switcher({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool?> showText = ValueNotifier(value);

    return ValueListenableBuilder(
      valueListenable: showText,
      builder: (_, val, __) {
        return Switch(value: val ?? true, 
          onChanged: (e){
            showText.value = e;
            onChanged(e);
          }
        );
      }
    );
  }
}