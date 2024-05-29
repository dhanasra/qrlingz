import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/pages/qrcode/bloc/qr_code_bloc.dart';
import 'package:qrlingz_app/pages/qrcode/settings/qr_settings_viewmodel.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/toast.dart';
import '../../../utils/validator.dart';
import '../../../widgets/styled_button.dart';

class QRSettingsView extends StatefulWidget {
  final QRData qrData;
  const QRSettingsView({super.key, required this.qrData});

  @override
  State<QRSettingsView> createState() => _QRSettingsViewState();
}

class _QRSettingsViewState extends State<QRSettingsView> {
  late QRSettingsViewModel _viewModel;
  late bool enablePassword;
  late bool enableScanLimit;

  @override
  void initState() {
    _viewModel = QRSettingsViewModel(widget.qrData);
    enablePassword = false;
    enableScanLimit = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QrCodeBloc, QrCodeState>(
      listener: (context, state) {
        if(state is QRCodeConfigured){
          context.goto(Routes.preview, args: state.data);
        }else if(state is Failure){
          Toast.show(context, message: "Something wrong ! Try again later.", type: "error");
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Configuration"),
          centerTitle: false,
          actions: [
            SizedBox(
              width: 92,
              height: 36,
              child: StyledButton(
                  onClick: () => _viewModel.handleSave(
                      context, enablePassword, enableScanLimit),
                  text: "SAVE"),
            ),
            16.w()
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: _viewModel.mode,
          builder: (_, validateMode, __) {
            return Form(
              autovalidateMode: validateMode,
              key: _viewModel.formkey,
              child: ListView(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 4),
                        child: Row(
                          children: [
                            'Enable Password'.tl(context),
                            const Spacer(),
                            Checkbox(
                                value: enablePassword,
                                onChanged: (v) {
                                  if (v != null) {
                                    setState(() {
                                      _viewModel.pwController.clear();
                                      enablePassword = v;
                                    });
                                  }
                                })
                          ],
                        ),
                      ),
                      Visibility(
                        visible: enablePassword,
                        replacement: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                              'Add an access control to display the content and a password will be requested each time the QR is scanned.'),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ValueListenableBuilder(
                              valueListenable: _viewModel.passwordVisible,
                              builder: (_, value, __) {
                                return TextFormField(
                                  enabled: enablePassword,
                                  controller: _viewModel.pwController,
                                  validator: (v) => Validator.isValidSimplePassword(v),
                                  obscureText: !value,
                                  decoration: InputDecoration(
                                      errorMaxLines: 2,
                                      fillColor: enablePassword
                                          ? null
                                          : Colors.grey.withOpacity(0.2),
                                      prefixIcon: const Icon(Icons.lock_outlined),
                                      hintText: "Enter password",
                                      helperMaxLines: 3,
                                      helperText:
                                          '* Add an access control to display the content and a password will be requested each time the QR is scanned.',
                                      suffixIcon: IconButton(
                                        onPressed: () =>
                                            _viewModel.passwordVisible.value =
                                                !_viewModel.passwordVisible.value,
                                        icon: Icon(_viewModel.passwordVisible.value
                                            ? Icons.remove_red_eye
                                            : Icons.remove_red_eye_outlined),
                                        color: Colors.grey,
                                      )),
                                  style: Theme.of(context).textTheme.titleMedium,
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Divider(),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 4),
                        child: Row(
                          children: [
                            'Scan Limit'.tl(context),
                            const Spacer(),
                            Checkbox(
                                value: enableScanLimit,
                                onChanged: (v) {
                                  if (v != null) {
                                    setState(() {
                                      _viewModel.scanLimitController.clear();
                                      enableScanLimit = v;
                                    });
                                  }
                                })
                          ],
                        ),
                      ),
                      Visibility(
                        visible: enableScanLimit,
                        replacement: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                              'Limit the number of times your QR can be scanned in total.'),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextFormField(
                            enabled: enableScanLimit,
                            controller: _viewModel.scanLimitController,
                            validator: (v) => Validator.isValidPositiveNumber(v),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              errorMaxLines: 2,
                              fillColor: enableScanLimit
                                  ? null
                                  : Colors.grey.withOpacity(0.2),
                              prefixIcon: const Icon(Icons.qr_code_scanner_outlined),
                              hintText: "Enter scan limit",
                              helperMaxLines: 3,
                              helperText:
                                  '* Limit the number of times your QR can be scanned in total.',
                            ),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Divider(),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
