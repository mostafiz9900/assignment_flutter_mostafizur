import 'dart:ui';

import 'package:assignment_flutter_mostafizur/app/app_pkg.dart';
import 'package:assignment_flutter_mostafizur/app/data/models/response/product_response.dart';
import 'package:assignment_flutter_mostafizur/app/modules/home/views/local_widget/cart_widget.dart';
import 'package:assignment_flutter_mostafizur/app/modules/home/views/local_widget/home_widget.dart';
import 'package:assignment_flutter_mostafizur/app/modules/home/views/local_widget/more_widget.dart';
import 'package:assignment_flutter_mostafizur/app/modules/home/views/local_widget/user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final AppLifecycleListener _listener;
  var bottomNavIndex = 0;
  final _productList=<ProductResponse>[];
  List<ProductResponse> get productList=>_productList;
  bool isNewest=true;
  bool isOldest=false;
  bool isLowToHighPrice=false;
  bool isHighToLowPrice=false;
  bool isBestSelling=false;
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
    readJson();
  }

  @override
  void onClose() {
    super.onClose();
    _listener.dispose();
  }
  void changeNewestFilter(bool value){
    isNewest=value;
    update();
  } void changeOldestFilter(bool value){
    isOldest=value;
    update();
  } void changeLowToHighPriceFilter(bool value){
    isLowToHighPrice=value;
    update();
  } void changeHighToLowPriceFilter(bool value){
    isHighToLowPrice=value;
    update();
  } void changeBestSellingFilter(bool value){
    isBestSelling=value;
    update();
  }
  void cancleFilter(){
    isNewest=false;
    isOldest=false;
    isLowToHighPrice=false;
    isHighToLowPrice=false;
    isBestSelling=false;
    update();
  }
  void changBottomNavBar(int index){
    bottomNavIndex=index;
    update();
  }
  final iconList = <String>[
    AssetsConstants.homeIconSvg,
    AssetsConstants.moreIconSvg,
    AssetsConstants.cartIconSvg,
    AssetsConstants.userProfileIconSvg,
  ];
  final bodyList=const <Widget>[
    HomeWidget(),
    MoreWidget(),
    CartWidget(),
    UserProfileWidget(),
  ];
  bool loadHomePage=true;
  Future<void> readJson() async {
 try{
   loadHomePage=true;
   update();
   final String response = await rootBundle.loadString(AssetsConstants.productJson);
   final data = productResponseFromMap(response);
   loadHomePage=false;
   _productList.assignAll(data);
   update();
   getUserInfo();
 }on Exception catch(error){
   printLog('load json $error');
 }
  }
  bool isSortBy=false;
  void sortBy(){
    loadHomePage=true;
    isSortBy= !isSortBy;
    update();
    if(isSortBy){
      _productList.sort((a, b) => a.id!.compareTo(b.id!));
      loadHomePage=false;
      update();
    }else{
      _productList.sort((b, a) => a.id!.compareTo(b.id!));
      loadHomePage=false;
      update();
    }

  }

  LoginResponse userInfo=LoginResponse();
  void getUserInfo(){
    var user=  StorageService.getMap(StorageConstants.userInfo);
    var info=LoginResponse.fromMap(user!);
    userInfo=info;
    update();
    printLog(info.toMap());
    printLog('=====user info====');
  }
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
