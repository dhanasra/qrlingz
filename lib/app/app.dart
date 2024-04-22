import 'package:flutter/material.dart';
import 'package:qrlingz_app/constants/theme_const.dart';
import 'package:qrlingz_app/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (s)=>RouteGenerator(settings: s).getRoute(),
      initialRoute: Routes.splash,
      theme: ThemeConst.getApplicationTheme()
    );
  }
}