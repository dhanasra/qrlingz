import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';

import '../bloc/auth_bloc.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final GlobalKey<FormState> formkey = GlobalKey();

  late TextEditingController emailController;
  late ValueNotifier<AutovalidateMode> mode;
  
  ForgotPasswordViewModel(){
    emailController = TextEditingController();
    mode = ValueNotifier(AutovalidateMode.disabled);
  }

  handleForgotPassword(BuildContext context){

    if(!formkey.currentState!.validate()){
      mode.value = AutovalidateMode.always;
      return;
    }

    context.read<AuthBloc>().add(
      PasswordForgotEvent(email: emailController.trim())
    );
  }

  
  @override
  dispose() {

  }
}