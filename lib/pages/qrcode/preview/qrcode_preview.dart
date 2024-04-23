import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/routes/app_routes.dart';

import '../../../constants/color_const.dart';

class QRCodePreview extends StatefulWidget {
  final QRData qrData;
  const QRCodePreview({super.key, required this.qrData});

  @override
  State<QRCodePreview> createState() => _QRCodePreviewState();
}

class _QRCodePreviewState extends State<QRCodePreview> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preview"),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: ()=>context.goto(Routes.home, clear: true)
          ),
          8.w(),
          IconButton(
            icon: const Icon(Icons.home_outlined),
            onPressed: ()=>context.goto(Routes.home, clear: true)
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
                  data: ""
                ),
              ),
            )),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                32.h(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: ColorConst.primary,
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: const Icon(Icons.share_outlined, color: Colors.white),
                          ),
                          16.h(),
                          "Share QR code".ts(context)
                        ],
                      ),
                    ),
                    16.w(),
                    SizedBox(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: ColorConst.primary,
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: const Icon(Icons.download_outlined, color: Colors.white),
                          ),
                          16.h(),
                          "Download".ts(context)
                        ],
                      ),
                    ),
                    16.w(),
                    SizedBox(
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: ColorConst.primary,
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: const Icon(Icons.image_outlined, color: Colors.white),
                          ),
                          16.h(),
                          "Add To Image".ts(context)
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}