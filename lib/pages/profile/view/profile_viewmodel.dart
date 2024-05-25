import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/pages/settings/bloc/account_bloc.dart';
import 'package:qrlingz_app/utils/global.dart';
import 'package:qrlingz_app/utils/toast.dart';

class ProfileViewModel extends BaseViewModel {
  
  final GlobalKey<FormState> formkey = GlobalKey();

  late TextEditingController fnameController;
  late TextEditingController lnameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;

  late ValueNotifier<AutovalidateMode> mode;

  ProfileViewModel(){
    fnameController = TextEditingController(text: Global.user?.firstName);
    lnameController = TextEditingController(text: Global.user?.lastName);
    phoneController = TextEditingController(text: Global.user?.phone);
    emailController = TextEditingController(text: Global.user?.email);
    mode = ValueNotifier(AutovalidateMode.disabled);
  }

  handleCancel(){
    fnameController = TextEditingController(text: Global.user?.firstName);
    lnameController = TextEditingController(text: Global.user?.lastName);
    phoneController = TextEditingController(text: Global.user?.phone);
    emailController = TextEditingController(text: Global.user?.email);
  }

  updateProfile(BuildContext context){
    if(!formkey.currentState!.validate()){
      mode.value = AutovalidateMode.always;
      return;
    }

    Global.user = Global.user!.copyWith(
      firstName: fnameController.trim(),
      lastName: lnameController.trim(),
      phone: phoneController.trim()
    );
    Toast.show(context, message: "Profile details updated successfully!", type: "success");
    context.read<AccountBloc>().add(
      SaveProfileEvent(
        fname: fnameController.trim(), 
        lname: lnameController.trim(),
        phone: phoneController.trim()
      ));
  }

  @override
  dispose() {

  }
}