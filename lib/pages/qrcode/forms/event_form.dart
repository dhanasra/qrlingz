import 'package:flutter/material.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/utils/validator.dart';
import 'package:qrlingz_app/widgets/date_picker_field.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

import '../../../widgets/time_picker_field.dart';

class EventForm extends StatelessWidget {
  const EventForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    final TextEditingController locController = TextEditingController();
    DateTime? startDate;
    TimeOfDay? startTime;
    DateTime? endDate;
    TimeOfDay? endTime;

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
                controller: nameController,
                validator: (v)=>Validator.validateNonNullOrEmpty(v, "Event Name"),
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
                controller: locController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.room_outlined),
                  hintText: "Enter location here"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ), 
               12.h(),
                "Start At".ts(context),
              8.h(),
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: DatePickerField(
                      fieldName: "Start Date",
                      onChanged: (e)=>startDate = e
                    ),
                  ),
                  16.w(),
                  Expanded(
                    flex: 4,
                    child: TimePickerField(
                      fieldName: "Time",
                      onChanged: (e)=>startTime=e,  
                    ),
                  ),
                ],
              ),
               12.h(),
                "End At".ts(context),
              8.h(),
              Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: DatePickerField(
                      fieldName: "End Date",
                      onChanged: (e)=>endDate=e,  
                    ),
                  ),
                  16.w(),
                  Expanded(
                    flex: 4,
                    child: TimePickerField(
                      fieldName: "Time",
                      onChanged: (e)=>endTime=e,  
                    ),
                  ),
                ],
              ),
               12.h(),
              "Description".ts(context),
              8.h(),
              TextFormField(
                controller: descController,
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

                  String qrData = "BEGIN:VEVENT\n"
                    "SUMMARY:${nameController.trim()}\n"
                    "DTSTART:${_formatDateTime(startDate, startTime)}Z\n"
                    "DTEND:${_formatDateTime(endDate, endTime)}Z\n"
                    "LOCATION:${locController.trim()}}\n"
                    "DESCRIPTION:${descController.trim()}\n"
                    "END:VEVENT";

                  context.goto(Routes.customize, args: { "data": {"value": qrData}, "name": "Event" });
                }, 
                text: "CREATE"
              )
            ],
          ),
        );
      }
    );
  }

  String _formatDateTime(DateTime? dateTime, TimeOfDay? timeOfDay) {
  return "${dateTime?.year.toString().padLeft(4, '0')}"
      "${dateTime?.month.toString().padLeft(2, '0')}"
      "${dateTime?.day.toString().padLeft(2, '0')}T"
      "${timeOfDay?.hour.toString().padLeft(2, '0')}"
      "${timeOfDay?.minute.toString().padLeft(2, '0')}";
  }
}