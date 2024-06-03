import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/pages/feedback/create/create_feedback_viewmodel.dart';
import 'package:qrlingz_app/widgets/custom_switch.dart';

import '../../../../widgets/styled_button.dart';

class SubmitFragment extends StatelessWidget {
  final CreateFeedbackViewModel vm;
  const SubmitFragment({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        "Submission Form".tl(context),
        8.h(),
        const Text("** Choose the fields that will be mandatory or optional for the user when sending the feedback", style: TextStyle(fontSize: 13),),
        16.h(),
        Row(
          children: [
            CustomSwitch(
              onChanged: (v){
                vm.emailMandatory = v;
              }
            ),
            Expanded(
              child: "Mandatory Email".tm(context, color: Colors.black87),
            ),
            
          ],
        ),
        Row(
          children: [
            CustomSwitch(
              onChanged: (v){
                vm.phoneMandatory = v;
              }
            ),
            Expanded(
              child: "Mandatory Phone".tm(context, color: Colors.black87),
            )
          ],
        ),

        const Divider(),

        16.h(),

        "Contact Information".tl(context),
        8.h(),
        TextFormField(
          controller: vm.websiteController,
          decoration: const InputDecoration(
            hintText: "Enter your website url"
          ),
          style: Theme.of(context).textTheme.titleMedium,
        ),

        50.h(),
        Align(
          alignment: Alignment.centerRight,
          child: StyledButton(
            w: 120,
            onClick: ()=>vm.goNext(context, 3),
            text: "Continue",
          ),
        )
        
      ],
    );
  }
}