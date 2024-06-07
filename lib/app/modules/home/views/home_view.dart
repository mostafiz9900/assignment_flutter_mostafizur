import 'dart:ui';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../../../app_pkg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

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

    return GetBuilder<HomeController>(
      builder: (homeCon) {
        return Scaffold(
          body:  SafeArea(
            child: homeCon.bodyList.elementAt(homeCon.bottomNavIndex)

          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            alignment: Alignment.center,
            height: 56,
            width: 56,

            decoration:  BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [hexToColor('#FF679B'), hexToColor('#FF7B51')])
            ),
            child: SvgPicture.asset(AssetsConstants.searchIconSvg,width: 26,height: 26,),

          ),
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: homeCon.iconList.length,
            tabBuilder: (int index, bool isActive) {
              final color = isActive
                  ? hexToColor('#FF679B')
                  : Colors.grey.shade500;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    homeCon.iconList[index],
                    width: 24,
                    color: color,
                  ),
                  const SizedBox(height: 4),

                ],
              );
            },
            backgroundColor: Colors.white,
            activeIndex: homeCon.bottomNavIndex,
            splashSpeedInMilliseconds: 300,
            notchSmoothness: NotchSmoothness.softEdge,
            gapLocation: GapLocation.center,
            leftCornerRadius: 10,
            rightCornerRadius: 10,
            onTap: (index) => homeCon.changBottomNavBar(index),
            shadow: BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 12,
              spreadRadius: 0.5,
              color: Colors.grey.withOpacity(0.20),
            ),
          ),
        );
      }
    );
  }
}
