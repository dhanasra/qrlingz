import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/pages/home/bloc/home_bloc.dart';
import 'package:qrlingz_app/pages/home/cubit/home_cubit.dart';
import 'package:qrlingz_app/pages/home/fragments/dashboard_fragment.dart';
import 'package:qrlingz_app/pages/home/fragments/favourites_fragment.dart';
import 'package:qrlingz_app/pages/home/fragments/history_fragment.dart';
import 'package:share_plus/share_plus.dart';

import '../../routes/app_routes.dart';

class HomeViewModel extends BaseViewModel {


  InterstitialAd? interstitialAd;
  bool isInterstitialAdLoaded = false;

  showAd(BuildContext context, String category, value){
    var show = category.toLowerCase()=="dynamic";

    if(show && isInterstitialAdLoaded && interstitialAd!=null ){
      interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          createQRCode(context, value);
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          createQRCode(context, value);
          isInterstitialAdLoaded = false;
        },
      );
      interstitialAd!.show();
      return;
    }
    createQRCode(context, value);
  }

  createQRCode(BuildContext context, value){
    if(value == "Feedback"){
      context.goto(Routes.createFeedback, args: value);
    }else{
      context.goto(Routes.create, args: value);
    }
  }

  final List<Map> bottomNavItems = [
    {'Home': Icons.home},
    {'Favourites': Icons.star},
    { '': Icons.add_box},
    {'History': Icons.access_time_rounded},
    {'Settings': Icons.settings}
  ];

  late PageController controller;
  late List<Widget> items;
  late BuildContext ctx;
  late ValueNotifier<bool> showAll;

  final GlobalKey<ScaffoldState> key = GlobalKey();

  HomeViewModel(BuildContext context){
    controller = PageController();
    controller = PageController()..addListener(() {
      context.read<HomeCubit>().onPageChange(
        controller.page!.floor()==2 ? 3 : controller.page!.floor());
    });

    items = [
      DashboardFrament(
        vm: this,
      ),
      const FavouritesFragment(),
      HistoryFragment(
        controller: controller,
        onOptionClick: (v)=>handleOptionClick(v)
      )
    ];
    ctx = context;
    showAll = ValueNotifier(false);
  }

  handleOptionClick(v){

    var type = v['type'];
    var data = v['data'] as QRData;

    if(type=="share"){
      Share.share(data.data["value"]);
    }else if(type=="edit"){
      ctx.goto(Routes.customize, args: {
        "data": {
          "value": data.data["value"]
        },
        "name": data.name
      });
    }else if(type=="delete"){
      ctx.read<HomeBloc>().add(RemoveHistory(id: data.id));
    }else{
      ctx.goto(Routes.preview, args: data);
    }
  }

  handleItemClick(BuildContext context, int idx){

    if(idx == 0 || idx == 1 || idx == 3){
      context.read<HomeCubit>().onPageChange(idx.toInt());
      controller.jumpToPage(idx.toInt());
    }else if(idx == 4){
      context.goto(Routes.settings);
    }

  }
  
  @override
  dispose() {
    
  }

}