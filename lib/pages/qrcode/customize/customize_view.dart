import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/pages/qrcode/customize/customize_viewmodel.dart';
import 'package:qrlingz_app/pages/qrcode/customize/options/text_customization.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

import '../../../constants/color_const.dart';

class CustomizeView extends StatefulWidget {
  final String data;
  const CustomizeView({super.key, required this.data});

  @override
  State<CustomizeView> createState() => _CustomizeViewState();
}

class _CustomizeViewState extends State<CustomizeView> {
  late CustomizeViewModel _viewModel;

  @override
  void initState() {
    _viewModel = CustomizeViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _viewModel.active,
      builder: (_, activeItem, __) {
        return Scaffold(
          appBar: AppBar(
            leading: activeItem!=null
            ? IconButton(
                onPressed: ()=>_viewModel.active.value = null, 
                icon: const Icon(Icons.close) 
              ): null,
            title: Text(_viewModel.getTitleText()),
            centerTitle: false,
            actions: [
              if(activeItem!=null)
              SizedBox(
                width: 90, height: 36,
                child: StyledButton(
                  secondary: true,
                  onClick: (){
                    context.goto(Routes.preview, args: QRData(
                      type: 0, name: "Text", data: {
                        "value": widget.data
                      }, isFavourite: false, created: DateTime(2022
                    )));
                  }, text: "OK"),
              )
              else
              SizedBox(
                width: 90, height: 36,
                child: StyledButton(
                  onClick: (){
                    context.goto(Routes.preview, args: QRData(
                      type: 0, name: "Text", data: {
                        "value": widget.data
                      }, isFavourite: false, created: DateTime(2022
                    )));
                  }, text: "SAVE"),
              ),
              16.w()
            ],
          ),
          body: Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  padding: const EdgeInsets.all(32),
                  alignment: Alignment.center,
                  color: Colors.grey,
                  child: Container(
                    height: 200,
                    color: Colors.white,
                    padding: const EdgeInsets.all(16),
                    child: PrettyQrView.data(
                      data: widget.data
                    ),
                  ),
                )),
              Expanded(
                flex: 6,
                child: activeItem == 5
                ? const TextCustomization()
                : GridView.builder(
                  itemCount: _viewModel.options.length,
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1
                  ),
                  itemBuilder: (_, idx){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: ()=>_viewModel.active.value = idx,
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: ColorConst.primary,
                              borderRadius: BorderRadius.circular(6)
                            ),
                            child: Icon(_viewModel.options[idx]["icon"] as IconData, color: Colors.white),
                          ),
                        ),
                        16.h(),
                        "${_viewModel.options[idx]["name"]}".ts(context)
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        );
      }
    );
  }
}