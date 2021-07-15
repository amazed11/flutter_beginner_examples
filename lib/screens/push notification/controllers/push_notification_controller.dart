import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class PushNotificationController extends GetxController {
  var debug = 'no data'.obs;
  @override
  void onInit() async {
    // TODO: implement onInit
    initPlatform();
    super.onInit();
  }

  void initPlatform() async {
    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      // Will be called whenever a notification is received in foreground
      // Display Notification, pass null param for not displaying the notification
      event.complete(event.notification);
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      print(result.notification.body);
      debug.value = result.notification.body!;
      print(debug.value);
    });

    await OneSignal.shared.setAppId("${dotenv.env['PUSH_APP_KEY']}");
  }
}
