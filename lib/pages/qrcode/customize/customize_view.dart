import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qrlingz_app/constants/data_const.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/pages/qrcode/customize/customize_viewmodel.dart';
import 'package:qrlingz_app/pages/qrcode/customize/options/color_customization.dart';
import 'package:qrlingz_app/pages/qrcode/customize/options/logo_customization.dart';
import 'package:qrlingz_app/pages/qrcode/customize/options/pixel_customization.dart';
import 'package:qrlingz_app/pages/qrcode/customize/options/text_customization.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/utils/utils.dart';
import 'package:qrlingz_app/widgets/styled_button.dart';

import '../../../constants/color_const.dart';

class CustomizeView extends StatefulWidget {
  final Map data;
  final String name;
  const CustomizeView({super.key, required this.data, required this.name});

  @override
  State<CustomizeView> createState() => _CustomizeViewState();
}

class _CustomizeViewState extends State<CustomizeView> {
  late CustomizeViewModel _viewModel;

  @override
  void initState() {
    _viewModel = CustomizeViewModel(widget.data, widget.name);
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
                onPressed: ()=>_viewModel.clearTemp(), 
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
                  onClick: ()=>_viewModel.saveTemp(), text: "OK"),
              )
              else
              SizedBox(
                width: 92, height: 36,
                child: StyledButton(
                  onClick: (){
                    context.goto(Routes.preview, args: QRData(
                      type: 0, name: "Text", data: widget.data, isFavourite: false, created: DateTime(2022
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
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  color: Colors.grey,
                  child: ValueListenableBuilder(
                    valueListenable: _viewModel.tempData,
                    builder: (_, value, __) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: value.color?["bg"]!=null
                                ? stringToColor(value.color?["bg"]) : Colors.white,
                              gradient: value.color?["bgg"]!=null
                                ? ColorConst.gradients[value.color?["bgg"]]! : null
                            ),
                            padding: const EdgeInsets.all(16),
                            child: PrettyQrView.data(
                              data: widget.data['value'],
                              errorCorrectLevel: 3,
                              decoration: PrettyQrDecoration(
                                 shape: value.pixels?["type"]=="Rounded"
                                 ? PrettyQrRoundedSymbol(
                                    borderRadius: value.pixels?["corner"]=="Smooth" 
                                      ? BorderRadius.circular(10)
                                      : BorderRadius.circular(2),
                                    color: PrettyQrBrush.gradient
                                    (
                                      gradient: value.color?["fgg"]!=null
                                      ? ColorConst.gradients[value.color?["fgg"]]!
                                      : LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: value.color?["fg"]!=null
                                        ? [
                                          stringToColor(value.color?["fg"])!,
                                          stringToColor(value.color?["fg"])!
                                        ]
                                        : [
                                          Colors.black, Colors.black
                                        ],
                                      ),
                                    ),
                                  )
                                : PrettyQrSmoothSymbol(
                                  roundFactor: value.pixels?["corner"]=="Smooth" ? 1: 0,
                                  color: PrettyQrBrush.gradient
                                    (
                                      gradient: value.color?["fgg"]!=null
                                      ? ColorConst.gradients[value.color?["fgg"]]!
                                      : LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: value.color?["fg"]!=null
                                        ? [
                                          stringToColor(value.color?["fg"])!,
                                          stringToColor(value.color?["fg"])!
                                        ]
                                        : [
                                          Colors.black, Colors.black
                                        ],
                                      ),
                                    ),
                                ),
                                image: value.logo!=null
                                ? PrettyQrDecorationImage(
                                  image: NetworkImage(value.logo!),
                                  position: PrettyQrDecorationImagePosition.embedded,
                                )
                                : null
                              )
                            ),
                          ),
                          if(value.text?["content"]!=null)
                            Container(
                              color: Colors.white,
                              width: 200,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                              child: Text(value.text!["content"], 
                                style: value.text!["font"]!=null
                                    ? (DataConst.fontFamilies.firstWhere((element) => element["name"]==value.text!["font"])["style"] as TextStyle).copyWith(
                                      color: value.text?["color"]!=null ? stringToColor(value.text?["color"]): null
                                    ) : TextStyle(
                                      color: value.text?["color"]!=null ? stringToColor(value.text?["color"]): null
                                    )))
                        ],
                      );
                    }
                  ),
                )),
              Expanded(
                flex: 6,
                child: activeItem == 1
                ? ColorCustomization(vm: _viewModel)
                : activeItem == 2
                ? LogoCustomization(vm: _viewModel)
                : activeItem == 3
                ? PixelCustomization(vm: _viewModel)
                : activeItem == 4
                ? TextCustomization(vm: _viewModel)
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