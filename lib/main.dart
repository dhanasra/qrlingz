import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:qrlingz_app/network/local_db.dart';

import 'app/app.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAJMazs8SsnxvS8xgJIaHOqDVj2of7h88c", 
      appId: "1:1054371633362:android:ecb77d7a1920f3731bb50b", 
      messagingSenderId: "1054371633362", 
      projectId: "qrlingz"
    )
  );

  try{
    final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    remoteConfig.getString('data');
  }catch(error){}

  await LocalDB.init();
  var currentLocale =  await LocalDB().getLangcode();

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'), 
      Locale('ta', 'IN'),
      Locale('ml', 'IN'),
      Locale('kn', 'IN'),
      Locale('hi', 'IN')
    ],
    path: 'res/translations',
    fallbackLocale: currentLocale,
    child: const App()));
}