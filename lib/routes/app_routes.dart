import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qrlingz_app/pages/home/cubit/home_cubit.dart';
import 'package:qrlingz_app/pages/home/home_view.dart';
import 'package:qrlingz_app/pages/qrcode/create/create_view.dart';
import 'package:qrlingz_app/pages/qrcode/customize/customize_view.dart';
import 'package:qrlingz_app/pages/scan/scan_view.dart';
import 'package:qrlingz_app/pages/settings/settings_view.dart';
import 'package:qrlingz_app/pages/welcome/welcome_view.dart';

import '../pages/splash/splash_view.dart';

class Routes {

  static const splash = '/splash';
  static const welcome = '/welcome';
  
  static const home = '/home';

  static const scan = '/scan';
  static const settings = '/settings';

  static const create = '/create';
  static const customize = '/customize';

}

class RouteGenerator {
  final RouteSettings settings;

  RouteGenerator({required this.settings});

  Route<dynamic> getRoute() {
    switch (settings.name) {
      case Routes.splash:
        return getTransistionPage(const SplashView());
      case Routes.welcome:
        return getTransistionPage(const WelcomeView());
      case Routes.home:
        return getTransistionPage(BlocProvider(
          create: (_)=>HomeCubit(), child: const HomeView()
        ));
      case Routes.scan:
        return getTransistionPage(const ScanView());
      case Routes.settings:
        return getTransistionPage(const SettingsView());
      case Routes.create:
        return getTransistionPage(CreateView(type: settings.arguments as String));
      case Routes.customize:
        return getTransistionPage(const CustomizeView());
      default:
        return unDefinedRoute();
    }
  }

  getTransistionPage(Widget child) {
    return PageTransition(
      child: child,
      settings: settings,
      type: PageTransitionType.fade,
    );
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Not Found'),
        ),
      ),
    );
  }

}