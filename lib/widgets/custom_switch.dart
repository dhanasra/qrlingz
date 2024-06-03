import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';

class CustomSwitch extends StatefulWidget {
  final ValueChanged onChanged;
  const CustomSwitch({super.key, required this.onChanged});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(useMaterial3: false),
      child: Switch(
        value: enabled,
        onChanged: (newValue) {
          setState(() {
            enabled = newValue;
          });
          widget.onChanged(newValue);
        },
        activeColor: context.theme().primaryColor,
        inactiveThumbColor: context.theme().primaryColorLight,
        activeTrackColor: context.theme().primaryColorLight,
        inactiveTrackColor: Colors.grey,
      ),
    );
  }
}