import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/push_notification_controller.dart';

class PushNotificationScreen extends StatelessWidget {
  PushNotificationScreen({Key? key}) : super(key: key);
  final PushNotificationController pushNotificationController =
      Get.put(PushNotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Push Notifications"),
      ),
      body: Container(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(
                  size: 50.0,
                ),
                Obx(() => Text("${pushNotificationController.debug.value}"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
