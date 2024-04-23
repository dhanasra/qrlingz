import 'package:flutter/material.dart';

class DatePickerField extends StatelessWidget {
  final TextEditingController controller;
  const DatePickerField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        showDatePicker(
          context: context, 
          firstDate: DateTime(1900), 
          lastDate: DateTime(2050)
        );
      },
      child: IgnorePointer(
        child: TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.room_outlined),
          ),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}