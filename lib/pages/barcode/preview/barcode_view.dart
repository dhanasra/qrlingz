import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/extensions/number_exten.dart';
import 'package:qrlingz_app/extensions/string_exten.dart';
import 'package:qrlingz_app/network/models/barcode_data.dart';
import 'package:qrlingz_app/pages/barcode/preview/barcode_viewmodel.dart';
import 'package:qrlingz_app/widgets/barcode_preview.dart';
import 'package:screenshot/screenshot.dart';

import '../../../common/image/image_bloc.dart';
import '../../../constants/data_const.dart';
import '../../../constants/string_const.dart';
import '../../../routes/app_routes.dart';

class BarcodeView extends StatefulWidget {
  final BarcodeData data;
  const BarcodeView({super.key, required this.data});

  @override
  State<BarcodeView> createState() => _BarcodeViewState();
}

class _BarcodeViewState extends State<BarcodeView> {
  late BarcodeViewModel _viewModel;

  @override
  void initState() {
    _viewModel = BarcodeViewModel(data: widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (v){
        context.goto(Routes.home, clear: true);
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text(StringConst.preview).tr(),
            centerTitle: false,
            actions: [
              // LikeButton(
              //   isLiked: _viewModel.qrdata.isFavourite 
              //     || Global.favourites.value.any((element) => element.id==_viewModel.qrdata.id),
              //   onTap: (isLiked)async{
              //     _viewModel.updateFavourite(!isLiked);
              //     return !isLiked;
              //   },
              //   likeBuilder: (bool isLiked) {
              //   return Icon(
              //     Icons.favorite,
              //     color: isLiked ? Colors.deepOrange : Colors.grey,
              //   );
              // },
              // ),
              // 8.w(),
              Visibility(
                visible: !DataConst.dynamics.contains(widget.data.name),
                child: IconButton(
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: ()=>context.goto(Routes.home, clear: true)
                ),
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
                    child: BarcodePreview(
                      value: widget.data.value, type: widget.data.name, design: widget.data.design)
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