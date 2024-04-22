import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrlingz_app/constants/assets_const.dart';
import 'package:qrlingz_app/constants/color_const.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/pages/scan/scan_viewmodel.dart';

class ScanView extends StatefulWidget {
  const ScanView({super.key});

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {

  late ScanViewModel _viewModel;

  @override
  void initState() {
    _viewModel = ScanViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                QRView(
                  key: _viewModel.qrKey, 
                  onQRViewCreated: (c)=> _viewModel.onQRViewCreated(c)
                ),

                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.white,
                          )
                        ),
                        child: Lottie.asset(AssetsConst.scanning),
                      ),
                      24.h(),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 250),
                        child: "Place QrCode Inside The View Finder To Scan It".bs(context, Colors.white),  
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(32),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: ColorConst.primary,
                          child: IconButton(
                            onPressed: (){}, 
                            icon: const Icon(Icons.image_outlined, color: Colors.white, size: 20)),
                        ),
                        24.w(),
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: ColorConst.primary,
                          child: IconButton(
                            onPressed: (){}, 
                            icon: const Icon(Icons.flashlight_on_outlined, color: Colors.white, size: 20)),
                        ),
                        24.w(),
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: ColorConst.primary,
                          child: IconButton(
                            onPressed: (){}, 
                            icon: const Icon(Icons.camera_front_outlined, color: Colors.white, size: 20)),
                        ),
                        24.w(),
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: ColorConst.primary,
                          child: IconButton(
                          onPressed: (){}, 
                          icon: const Icon(Icons.layers_outlined, color: Colors.white, size: 20,)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}