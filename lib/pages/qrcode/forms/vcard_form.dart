import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/utils/validator.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

class VcardForm extends StatelessWidget {
  const VcardForm({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController mailController = TextEditingController();
    final TextEditingController companyNameController = TextEditingController();
    final TextEditingController jobTitleController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController websiteController = TextEditingController();
    final TextEditingController noteController = TextEditingController();
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
              "Name".ts(context),
              8.h(),
              TextFormField(
                controller: nameController,
                validator: (v)=>Validator.validateNonNullOrEmpty(v, "Name"),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outlined),
                  hintText: "Enter name here"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Mobile Number".ts(context),
              8.h(),
              TextFormField(
                controller: phoneController,
                validator: (v)=>Validator.validatePhoneNumber(v),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone_android_outlined),
                  hintText: "Enter mobile number here"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),  
              12.h(),
              "Email Address".ts(context),
              8.h(),
              TextFormField(
                controller: mailController,
                validator: (v)=>Validator.validateEmail(v, required:  false),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: "Enter email address here"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Company Name".ts(context),
              8.h(),
              TextFormField(
                controller: companyNameController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.business_outlined),
                  hintText: "Enter company name here"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Job Title".ts(context),
              8.h(),
              TextFormField(
                controller: jobTitleController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.work_outline),
                  hintText: "Enter job title here"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              "Address".ts(context),
              8.h(),
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.room_outlined),
                  hintText: "Enter address here"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              12.h(),
              "Website".ts(context),
              8.h(),
              TextFormField(
                controller: websiteController,
                validator: (v)=>Validator.isValidURL(v, "Website", required: false),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.link_outlined),
                  hintText: "Enter website here"
                ),
                style: Theme.of(context).textTheme.titleMedium,
              ),
               12.h(),
              "Note".ts(context),
              8.h(),
              TextFormField(
                controller: noteController,
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: "Enter note here"
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
                  var data = "BEGIN:VCARD;VERSION:3.0;N:${nameController.trim()}";

                  if(phoneController.trim().isNotEmpty){
                    data += ";TEL:${phoneController.trim()}";
                  }

                  if(mailController.trim().isNotEmpty){
                    data += ";EMAIL:${mailController.trim()}";
                  }

                  if(noteController.trim().isNotEmpty){
                    data += ";NOTE:${noteController.trim()}";
                  }

                  if(addressController.trim().isNotEmpty){
                    data += ";ADR:${addressController.trim()}";
                  }

                  if(companyNameController.trim().isNotEmpty){
                    data += ";ORG:${companyNameController.trim()}";
                  }

                  if(jobTitleController.trim().isNotEmpty){
                    data += ";TITLE:${jobTitleController.trim()}";
                  }

                  if(websiteController.trim().isNotEmpty){
                    data += ";URL:${websiteController.trim()}";
                  }

                  data += ";END:VCARD";

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