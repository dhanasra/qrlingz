import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:qrlingz_app/constants/color_const.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppNotification {

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }


  Future<void> showDownloadNotification({required String? filePath}) async {
    try{
      await flutterLocalNotificationsPlugin.show(
      11,
      null,
      'Image downloaded successfully ! Click view to open.',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          '12',
          'DWLN',
          fullScreenIntent: true,
          importance: Importance.high,
          priority: Priority.high,
          onlyAlertOnce: true,
          icon: '@mipmap/ic_launcher', 
          actions: [
            AndroidNotificationAction(
              'view',
              'View',
              titleColor: ColorConst.primary,
              showsUserInterface: true,
            ),
          ],
        ),
      ),
      payload: filePath,
    );
    }catch(e){
      print(e);
    }
  }

  Future<void> showProgressNotification({
    required String title,
    required String body,
    required int channelId,
    required String channelName,
    required int progress,
    required String filePath,
  }) async {
    if (progress < 99) {
      await flutterLocalNotificationsPlugin.show(
        channelId,
        title,
        '$body: $progress%',
        NotificationDetails(
          android: AndroidNotificationDetails(
            '$channelId',
            channelName,
            fullScreenIntent: true,
            importance: Importance.high,
            priority: Priority.high,
            onlyAlertOnce: true,
            showProgress: true,
            ticker: 'ticker',
            enableLights: true,
            maxProgress: 100,
            progress: progress,
          ),
        ),
        payload: 'item x',
      );
    } else {
      await flutterLocalNotificationsPlugin.cancel(channelId);
      ++channelId;
      await flutterLocalNotificationsPlugin.show(
        channelId,
        title,
        'Download Complete',
        NotificationDetails(
          android: AndroidNotificationDetails(
            '$channelId',
            channelName,
            fullScreenIntent: true,
            importance: Importance.high,
            priority: Priority.high,
            onlyAlertOnce: true,
            actions: [
              const AndroidNotificationAction(
                'view',
                'View',
                showsUserInterface: true,
              ),
            ],
          ),
        ),
        payload: filePath,
      );
    }
  }

  Future<void> onDidReceiveNotificationResponse(NotificationResponse response) async {
    final String? payload = response.payload;
    if (payload != null && response.actionId == 'view') {
      await launchUrlString(payload);
    }
  }

  Future<void> show({
    required String title,
    required String body,
    required String channelId,
    required String channelName,
  }) async {
    var androidDetails = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: title,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      enableLights: true,
      playSound: true,
      showWhen: true,
    );

    var platformDetails = NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformDetails,
      payload: 'payload',
    );
  }
}