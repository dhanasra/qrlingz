import 'package:flutter/material.dart';
import 'package:qrlingz_app/base/base_viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  
  final List<Widget> items = [

  ];

  final List<Map> bottomNavItems = [
    {'Home': Icons.home},
    {'Favourites': Icons.star},
    { '': Icons.add_box},
    {'History': Icons.access_time_rounded},
    {'Settings': Icons.settings}
  ];

  late PageController controller;

  HomeViewModel(){
    controller = PageController();
  }

  
  @override
  dispose() {
    
  }

}