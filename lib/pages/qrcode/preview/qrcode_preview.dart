import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:like_button/like_button.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/pages/qrcode/preview/qrcode_previewmodel.dart';
import 'package:qrlingz_app/routes/app_routes.dart';
import 'package:qrlingz_app/utils/global.dart';
import 'package:screenshot/screenshot.dart';

import '../../../common/image/image_bloc.dart';
import '../../../constants/color_const.dart';
import '../../../constants/data_const.dart';
import '../../../constants/string_const.dart';
import '../../../utils/utils.dart';

class QRCodePreview extends StatefulWidget {
  final QRData qrData;
  const QRCodePreview({super.key, required this.qrData});

  @override
  State<QRCodePreview> createState() => _QRCodePreviewState();
}

class _QRCodePreviewState extends State<QRCodePreview> {
  late QrCodePreviewModel _viewModel;

  @override
  void initState() {
    _viewModel = QrCodePreviewModel(data: widget.qrData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ImageBloc, ImageState>(
      listener: (context, state) {
        if(state is ImagePicked){
          context.goto(Routes.editor, args: {"data": _viewModel.qrdata, "image": state.image});
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text(StringConst.preview).tr(),
            centerTitle: false,
            actions: [
              LikeButton(
                isLiked: _viewModel.qrdata.isFavourite 
                  || Global.favourites.value.any((element) => element.id==_viewModel.qrdata.id),
                onTap: (isLiked)async{
                  _viewModel.updateFavourite(!isLiked);
                  return !isLiked;
                },
                likeBuilder: (bool isLiked) {
                return Icon(
                  Icons.favorite,
                  color: isLiked ? Colors.deepOrange : Colors.grey,
                );
              },
              ),
              8.w(),
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
                  child: Screenshot(
                    controller: _viewModel.controller,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: widget.qrData.color?["bg"]!=null
                              ? stringToColor(widget.qrData.color?["bg"]) : Colors.white,
                            gradient: widget.qrData.color?["bgg"]!=null
                              ? ColorConst.gradients[widget.qrData.color?["bgg"]]! : null
                          ),
                          padding: const EdgeInsets.all(16),
                          child: PrettyQrView.data(
                            data: widget.qrData.data['value'],
                            errorCorrectLevel: 3,
                            decoration: PrettyQrDecoration(
                                shape: widget.qrData.pixels?["type"]=="Rounded"
                                ? PrettyQrRoundedSymbol(
                                  borderRadius: widget.qrData.pixels?["corner"]=="Smooth" 
                                    ? BorderRadius.circular(10)
                                    : BorderRadius.circular(2),
                                  color: PrettyQrBrush.gradient
                                  (
                                    gradient: widget.qrData.color?["fgg"]!=null
                                    ? ColorConst.gradients[widget.qrData.color?["fgg"]]!
                                    : LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: widget.qrData.color?["fg"]!=null
                                      ? [
                                        stringToColor(widget.qrData.color?["fg"])!,
                                        stringToColor(widget.qrData.color?["fg"])!
                                      ]
                                      : [
                                        Colors.black, Colors.black
                                      ],
                                    ),
                                  ),
                                )
                              : PrettyQrSmoothSymbol(
                                roundFactor: widget.qrData.pixels?["corner"]=="Smooth" ? 1: 0,
                                color: PrettyQrBrush.gradient
                                  (
                                    gradient: widget.qrData.color?["fgg"]!=null
                                    ? ColorConst.gradients[widget.qrData.color?["fgg"]]!
                                    : LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: widget.qrData.color?["fg"]!=null
                                      ? [
                                        stringToColor(widget.qrData.color?["fg"])!,
                                        stringToColor(widget.qrData.color?["fg"])!
                                      ]
                                      : [
                                        Colors.black, Colors.black
                                      ],
                                    ),
                                  ),
                              ),
                              image: widget.qrData.logo!=null
                              ? PrettyQrDecorationImage(
                                image: NetworkImage(widget.qrData.logo!),
                                position: PrettyQrDecorationImagePosition.embedded,
                              )
                              : null
                            )
                          ),
                        ),
                        if(widget.qrData.text?["content"]!=null)
                          Container(
                            color: Colors.white,
                            width: 200,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                            child: Text(widget.qrData.text!["content"], 
                              style: widget.qrData.text!["font"]!=null
                                  ? (DataConst.fontFamilies.firstWhere((element) => element["name"]==widget.qrData.text!["font"])["style"] as TextStyle).copyWith(
                                    color: widget.qrData.text?["color"]!=null ? stringToColor(widget.qrData.text?["color"]): null
                                  ) : TextStyle(
                                    color: widget.qrData.text?["color"]!=null ? stringToColor(widget.qrData.text?["color"]): null
                                  )))
                      ],
                    )
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
                              InkWell(
                                onTap: (){
                                  _viewModel.shareQRCode();
                                },
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Icon(Icons.share_outlined, color: Theme.of(context).highlightColor),
                                ),
                              ),
                              16.h(),
                              StringConst.shareOpt.ts(context)
                            ],
                          ),
                        ),
                        16.w(),
                        SizedBox(
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (){
                                  _viewModel.saveToGallery();
                                },
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Icon(Icons.download_outlined, color: Theme.of(context).highlightColor),
                                ),
                              ),
                              16.h(),
                              StringConst.downloadOpt.ts(context)
                            ],
                          ),
                        ),
                        16.w(),
                        SizedBox(
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: ()=>{
                                  context.read<ImageBloc>().add(PickImage())
                                },
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  child: Icon(Icons.image_outlined, color: Theme.of(context).highlightColor),
                                ),
                              ),
                              16.h(),
                              StringConst.addToImageOpt.ts(context)
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
        ),
    );
  }
}