import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qrlingz_app/common/image/image_bloc.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/pages/qrcode/editor/editor_viewmodel.dart';
import 'package:qrlingz_app/utils/utils.dart';
import 'package:screenshot/screenshot.dart';

import '../../../constants/color_const.dart';
import '../../../widgets/styled_button.dart';

class EditorView extends StatefulWidget {
  final QRData qrData;
  final File image;
  const EditorView({super.key, required this.qrData, required this.image});

  @override
  State<EditorView> createState() => _EditorViewState();
}

class _EditorViewState extends State<EditorView> {
  late EditorViewModel _viewModel;
  late File bgImage;

  double _xPosition = 0;
  double _yPosition = 0;
  int active = 0;

  double degrees = 0;
  double zoom = 1;

  @override
  void initState() {
    _viewModel = EditorViewModel();
    bgImage = widget.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ImageBloc, ImageState>(
      listener: (context, state) {
        if(state is ImagePicked){
          setState(() {
            bgImage = state.image;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add To Image"),
          centerTitle: false,
          actions: [
            SizedBox(
              width: 98,
              height: 36,
              child: StyledButton(
                  onClick: () => _viewModel.saveImage(context), text: "DONE"),
            ),
            16.w()
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.black,
                child: Screenshot(
                  controller: _viewModel.controller,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.file(bgImage),
                      Positioned(
                          left: _xPosition,
                          top: _yPosition,
                          child: GestureDetector(
                              onPanUpdate: (details) {
                                setState(() {
                                  _xPosition += details.delta.dx;
                                  _yPosition += details.delta.dy;
                                });
                              },
                              child: Transform.scale(
                                scale: zoom,
                                child: Transform.rotate(
                                  angle: degrees * (pi / 180),
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: widget.qrData.color?["bg"] != null
                                            ? stringToColor(
                                                widget.qrData.color?["bg"])
                                            : Colors.white,
                                        gradient: widget.qrData.color?["bgg"] != null
                                            ? ColorConst.gradients[
                                                widget.qrData.color?["bgg"]]!
                                            : null),
                                    padding: const EdgeInsets.all(16),
                                    child: PrettyQrView.data(
                                        data: widget.qrData.data["value"],
                                        errorCorrectLevel: 3,
                                        decoration: PrettyQrDecoration(
                                            shape:
                                                widget.qrData.pixels?["type"] ==
                                                        "Rounded"
                                                    ? PrettyQrRoundedSymbol(
                                                        borderRadius: widget.qrData
                                                                        .pixels?[
                                                                    "corner"] ==
                                                                "Smooth"
                                                            ? BorderRadius.circular(
                                                                10)
                                                            : BorderRadius.circular(
                                                                2),
                                                        color: PrettyQrBrush.gradient(
                                                          gradient:
                                                              widget.qrData.color?[
                                                                          "fgg"] !=
                                                                      null
                                                                  ? ColorConst
                                                                          .gradients[
                                                                      widget.qrData
                                                                              .color?[
                                                                          "fgg"]]!
                                                                  : LinearGradient(
                                                                      begin: Alignment
                                                                          .topCenter,
                                                                      end: Alignment
                                                                          .bottomCenter,
                                                                      colors:
                                                                          widget.qrData.color?["fg"] !=
                                                                                  null
                                                                              ? [
                                                                                  stringToColor(widget.qrData.color?["fg"])!,
                                                                                  stringToColor(widget.qrData.color?["fg"])!
                                                                                ]
                                                                              : [
                                                                                  Colors.black,
                                                                                  Colors.black
                                                                                ],
                                                                    ),
                                                        ),
                                                      )
                                                    : PrettyQrSmoothSymbol(
                                                        roundFactor:
                                                            widget.qrData.pixels?[
                                                                        "corner"] ==
                                                                    "Smooth"
                                                                ? 1
                                                                : 0,
                                                        color: PrettyQrBrush.gradient(
                                                          gradient:
                                                              widget.qrData.color?[
                                                                          "fgg"] !=
                                                                      null
                                                                  ? ColorConst
                                                                          .gradients[
                                                                      widget.qrData
                                                                              .color?[
                                                                          "fgg"]]!
                                                                  : LinearGradient(
                                                                      begin: Alignment
                                                                          .topCenter,
                                                                      end: Alignment
                                                                          .bottomCenter,
                                                                      colors:
                                                                          widget.qrData.color?["fg"] !=
                                                                                  null
                                                                              ? [
                                                                                  stringToColor(widget.qrData.color?["fg"])!,
                                                                                  stringToColor(widget.qrData.color?["fg"])!
                                                                                ]
                                                                              : [
                                                                                  Colors.black,
                                                                                  Colors.black
                                                                                ],
                                                                    ),
                                                        ),
                                                      ),
                                            image: widget.qrData.logo != null
                                                ? PrettyQrDecorationImage(
                                                    image: NetworkImage(
                                                        widget.qrData.logo!),
                                                    position:
                                                        PrettyQrDecorationImagePosition
                                                            .embedded,
                                                  )
                                                : null)),
                                  ),
                                ),
                              ))),
                    ],
                  ),
                ),
              ),
            ),
            if (active == 0)
              Container(
                height: 90,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          active = 1;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(Icons.rotate_left_outlined,
                            color: Theme.of(context).highlightColor),
                      ),
                    ),
                    36.w(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          active = 2;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(Icons.zoom_in,
                            color: Theme.of(context).highlightColor),
                      ),
                    ),
                    36.w(),
                    InkWell(
                      onTap: () => {context.read<ImageBloc>().add(PickImage())},
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30)),
                        child: Icon(Icons.image_outlined,
                            color: Theme.of(context).highlightColor),
                      ),
                    )
                  ],
                ),
              )
            else if (active == 1)
              Container(
                height: 90,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.rotate_left),
                    Expanded(
                      child: Slider(
                        min: 0,
                        max: 360,
                        value: degrees,
                        onChanged: (v) {
                          setState(() {
                            degrees = v;
                          });
                        })),
                    IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () {
                          setState(() {
                            active = 0;
                          });
                        }),
                  ],
                ),
              )
            else if (active == 2)
              Container(
                height: 90,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.zoom_in),
                    Expanded(child: Slider(
                      min: 0,
                      max: 1.5,
                      value: zoom, 
                      onChanged: (v) {
                        setState(() {
                          zoom = v;
                        });
                      })),
                    IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () {
                          setState(() {
                            active = 0;
                          });
                        }),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
