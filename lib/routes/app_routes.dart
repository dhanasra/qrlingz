import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qrlingz_app/pages/home/home_view.dart';
import 'package:qrlingz_app/pages/welcome/welcome_view.dart';

import '../pages/splash/splash_view.dart';

class Routes {

  static const splash = '/splash';
  static const welcome = '/welcome';
  
  static const home = '/home';

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
        return getTransistionPage(const HomeView());
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