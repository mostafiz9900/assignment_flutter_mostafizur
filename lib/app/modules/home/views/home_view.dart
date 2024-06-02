import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../app_pkg.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();

    _listener = AppLifecycleListener(
      // Handle the onExitRequested callback

      onDetach: _onDetach,
      onHide: _onHide,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
      onResume: _onResume,
      onShow: _onShow,
      onStateChange: _onStateChanged,
      onExitRequested: _onExitRequested,
    );
  }

  @override
  void dispose() {
    _listener.dispose();

    super.dispose();
  }

  // Ask the user if they want to exit the app. If the user
  // cancels the exit, return AppExitResponse.cancel. Otherwise,
  // return AppExitResponse.exit.
  Future<AppExitResponse> _onExitRequested() async {
    final response = await showDialog<AppExitResponse>(
      context: context,
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
  void _onDetach() => print('onDetach');

  void _onHide() => print('onHide');

  void _onInactive() => print('onInactive');

  void _onPause() => print('onPause');

  void _onRestart() => print('onRestart');

  void _onResume() => print('onResume');

  void _onShow() => print('onShow');


  // Listen to the app lifecycle state changes
  void _onStateChanged(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        _onDetached();
      case AppLifecycleState.resumed:
        _onResumed();
      case AppLifecycleState.inactive:
        _onInactive();
      case AppLifecycleState.hidden:
        _onHidden();
      case AppLifecycleState.paused:
        _onPaused();
    }
  }

  void _onDetached() => print('detached');

  void _onResumed() => print('resumed');

  // void _onInactive() => print('inactive');

  void _onHidden() => print('hidden');

  void _onPaused() => print('paused');
  @override
  Widget build(BuildContext context) {
    final ThemeServices themeServices = Get.find();
    // print(controller.hashCode);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        // centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                // themeServices.toggleTheme();
                Get.back();
              },
              child: const Text('Change Theme'),
            ),
          ],
        ),
      ),
    );
  }
}
