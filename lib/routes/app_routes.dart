import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qrlingz_app/models/qr_data.dart';
import 'package:qrlingz_app/pages/barcode/create/barcode_create_view.dart';
import 'package:qrlingz_app/pages/barcode/customize/barcode_customize_view.dart';
import 'package:qrlingz_app/pages/home/bloc/home_bloc.dart';
import 'package:qrlingz_app/pages/home/cubit/home_cubit.dart';
import 'package:qrlingz_app/pages/home/home_view.dart';
import 'package:qrlingz_app/pages/qrcode/create/create_view.dart';
import 'package:qrlingz_app/pages/qrcode/customize/customize_view.dart';
import 'package:qrlingz_app/pages/qrcode/editor/editor_view.dart';
import 'package:qrlingz_app/pages/qrcode/preview/qrcode_preview.dart';
import 'package:qrlingz_app/pages/scan/data/scan_data_view.dart';
import 'package:qrlingz_app/pages/scan/scanning/scan_view.dart';
import 'package:qrlingz_app/pages/settings/settings_view.dart';
import 'package:qrlingz_app/pages/welcome/welcome_view.dart';

import '../common/image/image_bloc.dart';
import '../pages/auth/bloc/auth_bloc.dart';
import '../pages/auth/login/login_view.dart';
import '../pages/auth/signup/signup_view.dart';
import '../pages/qrcode/bloc/qr_code_bloc.dart';
import '../pages/settings/bloc/account_bloc.dart';
import '../pages/splash/splash_view.dart';

class Routes {
  static const splash = '/splash';
  static const welcome = '/welcome';

  static const login = '/login';
  static const signup = '/signup';

  static const home = '/home';

  static const scan = '/scan';
  static const scanData = '/scanData';

  static const settings = '/settings';

  // qrcode

  static const create = '/create';
  static const customize = '/customize';
  static const preview = '/preview';
  static const editor = '/editor';

  // barcode
  static const createBarcode = '/createBarcode';
  static const barcodeCustomize = '/barcodeCustomize';
}

class RouteGenerator {
  final RouteSettings settings;

  RouteGenerator({required this.settings});

  Route<dynamic> getRoute() {
    switch (settings.name) {
      case Routes.splash:
        return getTransistionPage(const SplashView());
      case Routes.login:
        return getTransistionPage(BlocProvider(
          create: (context) => AuthBloc(),
          child: const LoginView(),
        ));
      case Routes.signup:
        return getTransistionPage(BlocProvider(
          create: (context) => AuthBloc(),
          child: const SignupView(),
        ));
      case Routes.welcome:
        return getTransistionPage(const WelcomeView());
      case Routes.home:
        return getTransistionPage(MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => HomeCubit(),
          ),
          BlocProvider(
            create: (context) => HomeBloc()..add(GetHistory()),
          ),
        ], child: const HomeView()));
      case Routes.scan:
        return getTransistionPage(const ScanView());
      case Routes.scanData:
        var args = settings.arguments as Map;
        return getTransistionPage(
            ScanDataView(data: args['data'], image: args['image']));
      case Routes.settings:
        return getTransistionPage(BlocProvider(
          create: (context) => AccountBloc(),
          child: const SettingsView(),
        ));
      case Routes.create:
        return getTransistionPage(BlocProvider(
          create: (context) => ImageBloc(),
          child: CreateView(type: settings.arguments as String),
        ));
      case Routes.customize:
        var args = settings.arguments as Map;
        return getTransistionPage(MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ImageBloc(),
            ),
            BlocProvider(
              create: (context) => QrCodeBloc(),
            ),
          ],
          child: CustomizeView(data: args['data'], name: args['name']),
        ));
      case Routes.preview:
        return getTransistionPage(BlocProvider(
          create: (context) => ImageBloc(),
          child: QRCodePreview(qrData: settings.arguments as QRData),
        ));
      case Routes.editor:
        var args = settings.arguments as Map;
        return getTransistionPage(BlocProvider(
          create: (context) => ImageBloc(),
          child: EditorView(qrData: args['data'], image: args['image']),
        ));
      case Routes.createBarcode: 
        var type = settings.arguments as String;
        return getTransistionPage(BarcodeCreateView(type: type));
      case Routes.barcodeCustomize: 
        var args = settings.arguments as Map;
        return getTransistionPage(BarcodeCustomizeView(data: args['data'], name: args['name']));
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
