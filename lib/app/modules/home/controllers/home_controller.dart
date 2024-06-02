import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final AppLifecycleListener _listener;
  @override
  void onInit() {
    super.onInit();
    _listener = AppLifecycleListener(
      // Handle the onExitRequested callback
      onExitRequested: _onExitRequested,
    );
  }

  @override
  void onReady() {
    super.onReady();
    print("on ready home controller");
  }

  @override
  void onClose() {
    super.onClose();
    _listener.dispose();
  }
// Ask the user if they want to exit the app. If the user
  // cancels the exit, return AppExitResponse.cancel. Otherwise,
  // return AppExitResponse.exit.
  Future<AppExitResponse> _onExitRequested() async {
    final response = await showDialog<AppExitResponse>(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (context) => AlertDialog.adaptive(
        title: const Text('Are you sure you want to quit this app?'),
        content: const Text('All unsaved progress will be lost.'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(AppExitResponse.cancel);
            },
          ),
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(AppExitResponse.exit);
            },
          ),
        ],
      ),
    );

    return response ?? AppExitResponse.exit;
  }
}