import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/pages/profile/view/profile_viewmodel.dart';
import 'package:qrlingz_app/utils/toast.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

import '../../../constants/string_const.dart';
import '../../../utils/validator.dart';
import '../../settings/bloc/account_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool editMode = false;
  late ProfileViewModel _viewModel;

  @override
  void initState() {
    _viewModel = ProfileViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountBloc, AccountState>(
      listener: (context, state) {
        
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('My Profile'),
          actions: [
            Visibility(
              visible: !editMode,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      editMode = true;
                    });
                  },
                  icon: const Icon(Icons.edit)),
            ),
            16.w()
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: _viewModel.mode,
          builder: (_, val, __) {
            return Form(
              autovalidateMode: val,
              key: _viewModel.formkey,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "First Name".ts(context, color: Colors.grey),
                            8.h(),
                            !editMode
                                ? _viewModel.fnameController.text.hls(context, elipsis: true)
                                : TextFormField(
                                    controller: _viewModel.fnameController,
                                    validator: (v) =>
                                        Validator.validateNonNullOrEmpty(
                                            v, "First Name"),
                                    decoration: InputDecoration(
                                        hintText: "Enter first name".tr()),
                                    style: Theme.of(context).textTheme.titleMedium,
                                  )
                          ],
                        ),
                      ),
                      12.w(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Last Name".ts(context, color: Colors.grey),
                            8.h(),
                            !editMode
                                ? _viewModel.lnameController.text.hls(context, elipsis: true)
                                : TextFormField(
                                    controller: _viewModel.lnameController,
                                    validator: (v) =>
                                        Validator.validateNonNullOrEmpty(
                                            v, "Last Name"),
                                    decoration: InputDecoration(
                                        hintText: "Enter first name".tr()),
                                    style: Theme.of(context).textTheme.titleMedium,
                                  )
                          ],
                        ),
                      )
                    ],
                  ),
                  16.h(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Email Address".ts(context, color: Colors.grey),
                      8.h(),
                      !editMode
                          ? _viewModel.emailController.text.hls(context, elipsis: true)
                          : InkWell(
                            onTap: (){
                              Toast.show(context, message: 'You cannot change your primary email address here.', type: "error");
                            },
                            child: AbsorbPointer(
                                child: TextFormField(
                                  controller: _viewModel.emailController,
                                  validator: (v) => Validator.validateEmail(v),
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.email_outlined),
                                      hintText: "Enter email address".tr()),
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                          ),
                    ],
                  ),
                  16.h(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Phone Number".ts(context, color: Colors.grey),
                      8.h(),
                      !editMode
                          ? (
                            _viewModel.phoneController.text.isEmpty
                            ? "N/A" : _viewModel.phoneController.text
                          ) .hls(context, elipsis: true)
                          : TextFormField(
                              controller: _viewModel.phoneController,
                              keyboardType: TextInputType.phone,
                              validator: (v) => Validator.validatePhoneNumber(v, required: false),
                              decoration: InputDecoration(
                                  prefixIcon:
                                      const Icon(Icons.phone_android_outlined),
                                  hintText: StringConst.phoneHint.tr()),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                    ],
                  ),
                  54.h(),
                  Visibility(
                    visible: editMode,
                    child: Row(
                      children: [
                        Expanded(
                          child: StyledButton(
                            outlined: true,
                            secondary: true,
                            onClick: (){
                              _viewModel.handleCancel();
                              setState(() {
                                editMode = false;
                              });
                            }, 
                            text: "Cancel"
                          ),
                        ),
                        16.w(),
                        Expanded(
                          child: StyledButton(
                            onClick: (){
                              _viewModel.updateProfile(context);
                              setState(() {
                                editMode = false;
                              });
                            }, 
                            text: "Save"
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
