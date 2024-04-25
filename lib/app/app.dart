import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrlingz_app/common/theme/theme_cubit.dart';
import 'package:qrlingz_app/constants/theme_const.dart';
import 'package:qrlingz_app/routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
              supportedLocales: const [
                Locale('en', 'US'), 
                Locale('ta', 'IN'),
                Locale('ml', 'IN'),
                Locale('kn', 'IN'),
                Locale('hi', 'IN')
              ],
              onGenerateRoute: (s) => RouteGenerator(settings: s).getRoute(),
              initialRoute: Routes.splash,
              theme: ThemeConst.getApplicationTheme(false),
              darkTheme: ThemeConst.getApplicationTheme(true),
              themeMode: mode,
            );
        },
      ),
    );
  }
}
