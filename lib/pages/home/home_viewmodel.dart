import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';
import 'package:qrlingz_app/extensions/context_exten.dart';
import 'package:qrlingz_app/pages/home/cubit/home_cubit.dart';
import 'package:qrlingz_app/pages/home/fragments/dashboard_fragment.dart';
import 'package:qrlingz_app/pages/home/fragments/favourites_fragment.dart';
import 'package:qrlingz_app/pages/home/fragments/history_fragment.dart';

import '../../routes/app_routes.dart';

class HomeViewModel extends BaseViewModel {
  
  final List<Widget> items = [
    const DashboardFrament(),
    const FavouritesFragment(),
    const HistoryFragment()
  ];

  final List<Map> bottomNavItems = [
    {'Home': Icons.home},
    {'Favourites': Icons.star},
    { '': Icons.add_box},
    {'History': Icons.access_time_rounded},
    {'Settings': Icons.settings}
  ];

  late PageController controller;

  HomeViewModel(BuildContext context){
    controller = PageController()..addListener(() {
      context.read<HomeCubit>().onPageChange(controller.page!.floor());
    });
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