import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/pages/auth/forgot_password/forgot_password_viewmodel.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/toast.dart';
import '../../../utils/validator.dart';
import '../../../widgets/styled_button.dart';
import '../bloc/auth_bloc.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late ForgotPasswordViewModel _viewModel;

  @override
  void initState() {
    _viewModel = ForgotPasswordViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Success) {
          Toast.show(context, message: 'Password reset link sent successfully! Check your email.', type: "success");
          context.goto(Routes.login, clear: true);
        } else if (state is Error && state.msg != null) {
          Toast.show(context, message: state.msg!, type: "error");
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: ValueListenableBuilder(
            valueListenable: _viewModel.mode,
            builder: (_, mode, __) {
              return Form(
                key: _viewModel.formkey,
                autovalidateMode: mode,
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  children: [
                    "Forgot Password ?".hl(context, bold: true),
                    "Password reset link will be sent to your registered email address."
                        .ts(context, align: TextAlign.left, color: Colors.grey.withOpacity(0.8)),
                    24.h(),
                    "Email Address".ts(context),
                    8.h(),
                    TextFormField(
                      controller: _viewModel.emailController,
                      validator: (v) => Validator.validateEmail(v),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_outlined),
                          hintText: "Enter email address".tr()),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    64.h(),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return StyledButton(
                            loading: state is Loading,
                            onClick: () =>
                                _viewModel.handleForgotPassword(context),
                            text: "SEND".toUpperCase());
                      },
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
