import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:crypto/crypto.dart' as crypto;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:path_provider/path_provider.dart';

import '../../../app_pkg.dart';




class Helpers {
  Helpers._();

  static String calculateTimeDifferenceBetween(
      {required DateTime startDate,  DateTime? endDate}) {
    DateTime currentDate =endDate?? DateTime. now();
    int seconds = currentDate.difference(startDate).inSeconds;
    if (seconds < 60) {
      return '$seconds second';
    } else if (seconds >= 60 && seconds < 3600){
      return '${startDate.difference(currentDate).inMinutes.abs()} minute';}
    else if (seconds >= 3600 && seconds < 86400){
      return '${startDate.difference(currentDate).inHours} hour';}
    else{
      return '${startDate.difference(currentDate).inDays} day';}
  }
  static List<DateTime> getNextNDays(int n) {
    List<DateTime> dates = [];
    DateTime now = DateTime.now();
    for (int i = 1; i <= n; i++) {
      dates.add(now.add(Duration(days: i)));
    }
    return dates;
  }




  static Color generateRandomPrimaryColor() {
    Random random = Random();
    int red = random.nextInt(256);
    int green = random.nextInt(256);
    int blue = random.nextInt(256);
    return Color.fromARGB(255, red, green, blue);
  }

  static void openDialog(void Function()? onPressed) {
    Get.dialog(
      AlertDialog(
        title: const Text("sebaghar"),
        content: const Text("yourAreNotOldPatient"),
        actions: [
          // TextButton(
          //   onPressed: () => Get.back(),
          //   child: Text(AppTranslations.no.tr),
          // ),
          TextButton(
            onPressed: onPressed,
            child: const Text("ok"),
          ),
        ],
      ),
    );
  }

  static AppBar customAppBar(
      {String? title,
      bool? search,
      bool? appointmentBack,
      onPressed,
      bool? searchDoctor,
      closeSearch,
      searchSaved,
      hintText,
      enabled,
      editController,
      keyboardType,
      clearSearch,
      onchangeSearch}) {
    return AppBar(
        // systemOverlayStyle:
        //     const SystemUiOverlayStyle(statusBarColor: Colors.orange),
        backgroundColor: Get.theme.primaryColor,
        centerTitle: false,
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        title: searchDoctor == true
            ? Row(
                children: [
                  IconButton(
                    onPressed: closeSearch,
                    icon: Icon(
                      Icons.arrow_back,
                      color: Get.theme.iconTheme.color,
                    ),
                  ),
                  //change
                  Flexible(
                    child: TextFormField(
                      keyboardType: keyboardType,
                      controller: editController,
                      autofocus: true,
                      onChanged: onchangeSearch,
                      enabled: enabled,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(color: Colors.white),
                        hintText: hintText,
                        border: InputBorder.none,
                      ),
                      onSaved: searchSaved,
                    ),
                  ),
                  IconButton(
                    onPressed: clearSearch,
                    icon: Icon(
                      Icons.close,
                      color: Get.theme.iconTheme.color,
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => appointmentBack == true
                              ? Get.offNamed(Routes.HOME)
                              : Get.back(),
                          icon: Icon(
                            Icons.arrow_back,
                            color: Get.theme.iconTheme.color,
                          ),
                        ),
                        Text(
                          title!.tr,
                          style: Get.theme.appBarTheme.titleTextStyle,
                        ),
                      ],
                    ),
                  ),
                  search == true
                      ? IconButton(
                          onPressed: onPressed,
                          icon: Icon(
                            Icons.search,
                            color: Get.theme.iconTheme.color,
                          ),
                        )
                      : Container()
                ],
              ));
  }

  static BoxDecoration createButtonDecoration({double? radius}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 0.0),
      // border: Border.all(
      //   color: Colors.black26,
      // ),
      color: Colors.grey.withOpacity(0.13),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey.withOpacity(0.2),
      //     spreadRadius: 1,
      //     blurRadius: 2,
      //     offset: const Offset(0, 0), // changes position of shadow
      //   ),
      // ]
    );
  }

  static BoxDecoration createDropdownButtonDecoration({double? radius}) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius ?? 0.0),
      // border: Border.all(
      //   color: Colors.black26,
      // ),
      color: Colors.white,
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey.withOpacity(0.2),
      //     spreadRadius: 1,
      //     blurRadius: 2,
      //     offset: const Offset(0, 0), // changes position of shadow
      //   ),
      // ]
    );
  }

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static void snackbarForErorr({
    required String titleText,
    required String bodyText,
    double? topMargin,
  }) {
    Get.snackbar(titleText, bodyText,
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.only(
            top: topMargin ?? Get.height * 0.0,
            left: Get.width * 0.05,
            right: Get.width * 0.05),
        backgroundColor: Colors.red.withOpacity(0.9),
        colorText: Colors.white);
  }

  static void toast(String error) async {
    await Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void toastError(String error) async {
    await Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static void snackBarForSuccess({
    dynamic titleText,
    dynamic bodyText,
    double? topMargin,
  }) {
    Get.snackbar(titleText, bodyText,
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.only(
            top: topMargin ?? Get.height * 0.0,
            left: Get.width * 0.05,
            right: Get.width * 0.05),
        // backgroundColor: fromHex('#E9A9AF'),
        backgroundColor: Colors.black,
        colorText: Colors.white);
  }

  static void showSnackBarBuild(
      {required BuildContext context, required String message}) {
    final snackBar = SnackBar(
      backgroundColor: Get.theme.primaryColor,
      content: Text(
        message,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void snackbarForErorr2({
    String? titleText,
    required String bodyText,
    double? topMargin,
  }) {
    Get.snackbar("", "",
        titleText: const SizedBox.shrink(),
        messageText: Text(
          bodyText,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
        snackPosition: SnackPosition.TOP,
        maxWidth: Get.width * 0.7,
        padding: const EdgeInsets.only(bottom: 15, left: 12, right: 10, top: 5),
        margin: EdgeInsets.only(
            top: 25, left: Get.width * 0.05, right: Get.width * 0.05),
        borderRadius: 4,
        backgroundColor: Colors.red.withOpacity(0.9),
        colorText: Colors.white);
  }

  static Future<void> snackBarForSuccess2({
    String? titleText,
    required String bodyText,
    double? topMargin,
  }) async {
    Get.snackbar("", "",
        titleText: const SizedBox.shrink(),
        messageText: Text(
          bodyText,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
        snackPosition: SnackPosition.TOP,
        maxWidth: Get.width * 0.7,
        padding: const EdgeInsets.only(bottom: 15, left: 12, right: 10, top: 5),
        margin: EdgeInsets.only(
            top: 25, left: Get.width * 0.05, right: Get.width * 0.05),
        borderRadius: 4,
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white);
  }

  //Time Of Day
  static Future dayOfTime(BuildContext context) async {
    final TimeOfDay? timePicker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            datePickerTheme: DatePickerThemeData(
              headerBackgroundColor: Get.theme.primaryColor,
              headerForegroundColor: Colors.white,
              backgroundColor: Colors.white,
            ),
            colorScheme: ColorScheme.light(
              primary: Get.theme
                  .primaryColor, // <-- SEE HERE  onPrimary: Colors.white, // <-- SEE HERE
              onSecondary: Get.theme
                  .primaryColor, // <-- SEE HERE  secondary: Get.theme.primaryColor, // <-- SEE HERE
            ),
            textButtonTheme: const TextButtonThemeData(
                // style: TextButton.styleFrom(
                //   primary: Colors.w, // button text color
                // ),
                ),
          ),
          child: child!,
        );
      },
    );

    return '${int.parse(timePicker!.hourOfPeriod.toString().split('.')[0]) <= 9 ? "0${int.parse(timePicker!.hourOfPeriod.toString().split('.')[0])}" : int.parse(timePicker!.hourOfPeriod.toString().split('.')[0])} :${timePicker.minute <= 9 ? "0${timePicker.minute}" : timePicker.minute} ${timePicker.period.toString().split('.')[1]}';
  }

  //Time Of Day
  static Future dayOfTimeDiagonstic(BuildContext context) async {
    final TimeOfDay? timePicker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            datePickerTheme: DatePickerThemeData(
              headerBackgroundColor: Get.theme.primaryColor,
              headerForegroundColor: Colors.white,
              backgroundColor: Colors.white,
            ),
            colorScheme: ColorScheme.light(
              primary: Get.theme
                  .primaryColor, // <-- SEE HERE  onPrimary: Colors.white, // <-- SEE HERE
              onSecondary: Get.theme
                  .primaryColor, // <-- SEE HERE  secondary: Get.theme.primaryColor, // <-- SEE HERE
            ),
            textButtonTheme: const TextButtonThemeData(
                // style: TextButton.styleFrom(
                //   primary: Colors.w, // button text color
                // ),
                ),
          ),
          child: child!,
        );
      },
    );

    return '${int.parse(timePicker!.hourOfPeriod.toString().split('.')[0]) <= 9 ? "0${int.parse(timePicker!.hourOfPeriod.toString().split('.')[0])}" : int.parse(timePicker!.hourOfPeriod.toString().split('.')[0])} :${timePicker.minute <= 9 ? "0${timePicker.minute}" : timePicker.minute} ${timePicker.period.toString().split('.')[1]}';
  }

  // Date picker
  static Future<String?> datePickerShow([String? dateFormate]) async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              datePickerTheme: DatePickerThemeData(
                headerBackgroundColor: Get.theme.primaryColor,
                headerForegroundColor: Colors.white,
                backgroundColor: Colors.white,
              ),
              colorScheme: ColorScheme.light(
                primary: Get.theme
                    .primaryColor, // <-- SEE HERE  onPrimary: Colors.white, // <-- SEE HERE
                onSecondary: Get.theme
                    .primaryColor, // <-- SEE HERE  secondary: Get.theme.primaryColor, // <-- SEE HERE
              ),
              textButtonTheme: const TextButtonThemeData(
                  // style: TextButton.styleFrom(
                  //   primary: Colors.w, // button text color
                  // ),
                  ),
            ),
            child: child!,
          );
        },
        context: Get.overlayContext!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      printLog(pickedDate);
      String formattedDate =
          DateFormat(dateFormate ?? 'yyyy-MM-dd').format(pickedDate);
      printLog(formattedDate);

      return formattedDate;
    } else {}
    return null;
  }

  static Future<DateTime?> showDateTimePicker({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    initialDate ??= DateTime.now();
    firstDate ??= initialDate.subtract(const Duration(days: 365 * 100));
    lastDate ??= firstDate.add(const Duration(days: 365 * 200));

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      barrierDismissible: false,
      helpText: "selectDate.",
      cancelText: "cancel",
      confirmText: "ok",
      // locale: Locale( StorageService.read(StorageConstants.languageCode) ?? AppConst.langCodeEn),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            datePickerTheme: DatePickerThemeData(
              headerBackgroundColor: Get.theme.primaryColor,
              headerForegroundColor: Colors.white,
              backgroundColor: Colors.white,
            ),
            colorScheme: ColorScheme.light(
              primary: Get.theme
                  .primaryColor, // <-- SEE HERE  onPrimary: Colors.white, // <-- SEE HERE
              onSecondary: Get.theme
                  .primaryColor, // <-- SEE HERE  secondary: Get.theme.primaryColor, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => ColorConstants.white),
                foregroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                overlayColor: MaterialStateColor.resolveWith(
                    (states) => ColorConstants.editTextFillColor),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate == null) return null;

    if (!context.mounted) return selectedDate;

    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDate),
      barrierDismissible: false,
      cancelText: "cancel",
      confirmText: "ok",
      helpText: "selectDate",
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            // This uses the _timePickerTheme defined above
            timePickerTheme: timePickerTheme,
            textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => ColorConstants.backgroundColor),
                foregroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.white),
                overlayColor: MaterialStateColor.resolveWith(
                    (states) => ColorConstants.backgroundColor),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    var result = selectedTime == null
        ? selectedDate
        : DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            selectedTime.hour,
            selectedTime.minute,
          );
    return result;
  }

  static final timePickerTheme = TimePickerThemeData(
    // backgroundColor: AppColors.secondaryColor,
    hourMinuteShape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: ColorConstants.backgroundColor, width: 2),
    ),
    dayPeriodBorderSide:
        BorderSide(color: ColorConstants.backgroundColor, width: 4),
    // dayPeriodColor: Colors.blueGrey.shade600,
    // shape:  RoundedRectangleBorder(
    //   borderRadius:const BorderRadius.all(Radius.circular(8)),
    //   side: BorderSide(color:  AppColors.primaryColor, width: 2),
    // ),
    // dayPeriodTextColor: Colors.white,
    // dayPeriodShape:  RoundedRectangleBorder(
    //   borderRadius:const BorderRadius.all(Radius.circular(8)),
    //   side: BorderSide(color:  AppColors.primaryColor, width: 4),
    // ),
    hourMinuteColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? ColorConstants.backgroundColor
            : Colors.blueGrey.shade200),
    hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? Colors.white
            : ColorConstants.backgroundColor),
    dialHandColor: ColorConstants.colorPrimary,
    // dialBackgroundColor: Colors.blueGrey.shade400,
    // hourMinuteTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    // dayPeriodTextStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
    // helpTextStyle:
    // const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
    // inputDecorationTheme: const InputDecorationTheme(
    //   border: InputBorder.none,
    //   contentPadding: EdgeInsets.all(0),
    // ),
    // dialTextColor: MaterialStateColor.resolveWith(
    //         (states) => states.contains(MaterialState.selected) ? Colors.orange : Colors.white),
    entryModeIconColor: ColorConstants.colorPrimary,
  );
  static Future<String?> datePickerShowForBirthDay(
      [String? dateFormate]) async {
    DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: ColorConstants.colorPrimary,
                onPrimary: Colors.white,
                onSurface: ColorConstants.colorPrimary,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(foregroundColor: Colors.red),
              ),
            ),
            child: child!,
          );
        },
        context: Get.overlayContext!,
        initialDate: DateTime(DateTime.now().year - 18),
        firstDate: DateTime(1950),
        lastDate: DateTime(DateTime.now().year - 18));

    if (pickedDate != null) {
      printLog(pickedDate);
      String formattedDate =
          DateFormat(dateFormate ?? 'yyyy-MM-dd').format(pickedDate);
      printLog(formattedDate);

      return formattedDate;
    } else {}
    return null;
  }

  static monthYear(String dateStart) {
    DateFormat inputFormat = DateFormat('dd/MM/yyyy hh:mm:ss a');
    DateTime input = inputFormat.parse(dateStart);
    String result = DateFormat('MM/yyyy').format(input);
    return result;
  }

  static String formatTime(String time) {
    String dateTime =
        DateFormat.jm().format(DateFormat("hh:mm:ss").parse(time));
    return dateTime;
  }

  static String checkCardNumber(String cardnumber) {
    String number = "";
    final String stripped = cardnumber.replaceAll(RegExp(r'[^\d]'), '');
    if (stripped.length > 8) {
      final String middle = cardnumber.substring(4, 6).trim();
      final String middle1 = cardnumber
          .substring(6, cardnumber.length - 8)
          .trim()
          .replaceAll(RegExp(r'\d'), 'X');
      final String middle2 = cardnumber
          .substring(8, cardnumber.length - 4)
          .trim()
          .replaceAll(RegExp(r'\d'), 'X');
      number = stripped.substring(0, 4) +
          " " +
          middle +
          "" +
          middle1 +
          " " +
          middle2 +
          ' ' +
          stripped.substring(stripped.length - 4);
    }

    return number;
  }

  static String cardMaskingStart(String cardnumber) {
    String number = "";

    final String stripped = cardnumber.replaceAll(RegExp(r'[^\d]'), '');
    if (stripped.length > 8) {
      final String middle = cardnumber
          .trim()
          .substring(6, cardnumber.length - 4)
          .replaceAll(RegExp(r'\d'), '*')
          .replaceAll(" ", "");

      number = stripped.substring(0, 6) +
          middle +
          stripped.substring(stripped.length - 4);
    }
    return number.trim();
  }

  static void checkLogin({required VoidCallback onPressed}) {
    if (StorageService.read(StorageConstants.userInfo) == null) {
      Helpers.openAuthAlertDialog(() {
        Get.offAndToNamed(Routes.LOGIN);
      });
    } else {
      onPressed();
    }
  }

  static openAuthAlertDialog(VoidCallback? onPressed) {
    Get.dialog(
        AlertDialog(
          //title: const Text('Are Yor Sure?'),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          elevation: 0.0,
          titlePadding: EdgeInsets.zero,

          // content: Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     AppSpace.spaceH10,
          //     const Text(
          //       "আপনাকে লগইন করতে হবে।\n আপনি কি রাজি?",
          //       textAlign: TextAlign.center,
          //     ),
          //   ],
          // ),
          //আপনাকে লগইন করতে হবে।\n আপনি কি রাজি?
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          actions: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppSpace.spaceH30,
                Text(
                  "youUstLoginDoYouAgree",
                  textAlign: TextAlign.center,
                ),
                AppSpace.spaceH10,
                Container(
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Get.back(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade300,
                            minimumSize: const Size(80, 40),
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            textStyle: const TextStyle(
                              fontSize: 15,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0)),
                          ),
                          child: Text(
                            "no",
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      AppSpace.spaceW20,
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Get.theme.primaryColor,
                            minimumSize: const Size(80, 40),
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            textStyle: const TextStyle(fontSize: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0)),
                          ),
                          child: Text("yes",
                              style: const TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                AppSpace.spaceH10,
              ],
            ),
          ],
        ),
        barrierDismissible: false);
  }

  static openLogoutAlertDialog(VoidCallback? onPressed) {
    Get.dialog(
        AlertDialog(
          //title: const Text('Are Yor Sure?'),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          elevation: 0.0,
          titlePadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          actions: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppSpace.spaceH30,
                Text(
                  "areYouSure",
                  textAlign: TextAlign.center,
                ),
                AppSpace.spaceH10,
                Container(
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Get.back(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade300,
                            minimumSize: const Size(80, 40),
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            textStyle: const TextStyle(
                              fontSize: 15,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0)),
                          ),
                          child: Text(
                            "no",
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      AppSpace.spaceW20,
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onPressed,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Get.theme.primaryColor,
                            minimumSize: const Size(80, 40),
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            textStyle: const TextStyle(fontSize: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22.0)),
                          ),
                          child: Text("yes",
                              style: const TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                AppSpace.spaceH10,
              ],
            ),
          ],
        ),
        barrierDismissible: false);
  }

  static openWelcomeDialog(VoidCallback? onPressed) {
    Get.dialog(
        AlertDialog(
          //title: const Text('Are Yor Sure?'),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          elevation: 0.0,
          titlePadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          actions: [
            SizedBox(
              width: Get.width - 40,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppSpace.spaceH30,
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60 / 2),
                    child: Image.asset(
                      AssetsConstants.appLogo,
                      height: 60,
                      width: 60,
                    ),
                  ),
                  AppSpace.spaceH10,
                  Text("welcomeToSebaGhar"),
                  AppSpace.spaceH10,
                  Container(
                      child: Text(
                    "youHaveSuccessfullyChangedYourFamilyAccount",
                    textAlign: TextAlign.center,
                  )),
                  AppSpace.spaceH10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 50,
                          child: Text(
                            "ok",
                            style: TextStyle(color: Colors.white),
                          ),
                          alignment: Alignment.center,
                          decoration:
                              BoxDecoration(color: ColorConstants.colorPrimary),
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        barrierDismissible: false);
  }

  //passwordVisivilityMethod
  static IconButton passwordVisivilityMethod(
      void Function()? onPressed, bool isVisible) {
    return IconButton(
      splashColor: Colors.transparent,
      onPressed: onPressed,
      icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
    );
  }

  static String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);
    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  static Text appDiveder() {
    return Text(
      "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------",
      style: TextStyle(color: Colors.grey.shade300),
      maxLines: 1,
      overflow: TextOverflow.visible,
    );
  }

  static String handleErrorApi(Response response) {
    var statusCode = response.statusCode;
    switch (statusCode) {
      case 400:
        printLog('Bad request status code : $statusCode');
        // break;
        return "Bad request status code : $statusCode";
      case 401:
        printLog('Unauthorized status code : $statusCode');
        return "Unauthorized status code : $statusCode";
      case 404:
        printLog('Not found status code : $statusCode');
        return "Not found status code : $statusCode";
      default:
        printLog('Unknown error occurred status code : $statusCode');
        return "Unknown error occurred status code : $statusCode";
    }
  }

  static String handleErrorException(error) {
    if (error is SocketException) {
      printLog('Network error : $error');
      return "Network error : $error";
    } else if (error is TimeoutException) {
      printLog('Request timed out : $error');
      return "Request timed out : $error";
    } else {
      printLog('Unknown error $error');
      return "Unknown error : $error";
    }
  }

  static Future<String?> picImage(ImageSource type) async {
    try {
      //imgLoader(false);
      final imagePicker = await ImagePicker().pickImage(
          source: type == ImageSource.camera
              ? ImageSource.camera
              : ImageSource.gallery,
          imageQuality: 80,
          maxHeight: 500,
          maxWidth: 450);
      if (imagePicker == null) return null;
      final imageTemp = File(imagePicker.path);
      final bytes = File(imagePicker.path).readAsBytesSync();
      String img64 = base64Encode(bytes);
      var imgDecode64 = base64Decode(img64);
      printLog(imgDecode64);
      printLog(imagePicker.path);
      printLog(imageTemp);

      return img64;
    } on PlatformException catch (e) {
      printLog("Failed to pick image: $e");
    }
    return null;
  }

  static Future<File?> tokeImageForFile(ImageSource type) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? imagePicker = await picker.pickImage(
          source: type == ImageSource.camera
              ? ImageSource.camera
              : ImageSource.gallery,
          imageQuality: 80,
          maxHeight: 500,
          maxWidth: 450);
      if (imagePicker == null) return null;
      final imageTemp = File(imagePicker.path);
      return imageTemp;
    } on PlatformException catch (e) {
      printLog("Failed to pick image: $e");
    }
    return null;
  }

  static Future<File?> selectVideo() async {
    final ImagePicker picker = ImagePicker();
    // final XFile? pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    final XFile? pickedFile = await picker.pickMedia();
    if (pickedFile != null) {
      final videoFile = File(pickedFile.path);
      return videoFile;
    }
    return null;
  }

  static Future<String?> saveBitmapToExtFilesDir(
      ui.Image bitmap, String fileName) async {
    final directory = await getExternalStorageDirectory();
    if (directory == null) {
      return null; // Handle case where external storage is unavailable
    }
    final filePath = '${directory.path}/$fileName';
    final file = File(filePath);

    try {
      await file.create(recursive: true); // Ensure directory exists
      final sink = file.openWrite(mode: FileMode.write);
      await saveImageToJPEGFile(bitmap, filePath);
      await sink.flush();
      await sink.close();
      return filePath;
    } catch (e) {
      debugPrint('Error saving bitmap: $e'); // Log for debugging
      return null;
    }
  }

  static Future<void> saveImageToJPEGFile(ui.Image image, String filePath,
      {int quality = 100}) async {
    Uint8List? bytes = await encodeToJpeg(image, quality);
    File(filePath).writeAsBytesSync(bytes!);
  }

  static Future<Uint8List?> encodeToJpeg(ui.Image image, int quality) async {
    try {
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.rawRgba);
      if (byteData == null) {
        throw Exception("Failed to convert image to byte data.");
      }

      var byteList = byteData.buffer;

      img.Image imgImage = img.Image.fromBytes(
        width: image.width,
        height: image.height,
        bytes: byteList,
      );

      return img.encodeJpg(imgImage, quality: quality);
    } catch (e) {
      print("Error encoding image to JPEG: $e");
      return null;
    }
  }

}

extension HexColorApp on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension StringToInt on String {
  int parseInt() {
    return int.parse(this);
  }
}

extension FancyNum on num {
  num plus(num other) => this + other;

  num times(num other) => this * other;
}

extension ExtendedString on String {
  bool get isValidName {
    return !contains(RegExp(r'[0–9]'));
  }
}

extension DateTimeFormat on DateTime {
  String get ddMMyy => DateFormat("dd-MM-yy").format(this);
  String ddMMyyyy(String formate) {
    return DateFormat(formate).format(this);
  }

  String get yyyDDmm => DateFormat("yyyy-MM-dd").format(this);
  String get mmYYYY => DateFormat("MM-yyyy").format(this);
  String get eMMMd => DateFormat('E, MMM d').format(this);
  String get mmDDyyHHmmA => DateFormat('MM/dd/yyyy hh:mm a').format(this);
  String get yyyDDmmNumber => DateFormat("yyyyMMdd").format(this);
}

extension StringExtension on String {
  String toCapitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

Widget titleTextWidget({required String text}) {
  return Text(
    text.tr,
    style: Get.textTheme.bodySmall!,
  );
}

Widget insideBodyText({required String text}) {
  return Text(
    text,
    style: Get.textTheme.bodySmall!.copyWith(
        fontWeight: FontWeight.w400, fontSize: 14, color: HexColor('#505050')),
  );
}

ButtonStyle elevatedButtonStyleCustom() => ElevatedButton.styleFrom(
      backgroundColor: Get.theme.primaryColor,
      minimumSize: Size(Get.width, 40),
      padding: const EdgeInsets.symmetric(horizontal: 2),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    );

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}

// WillPopScopeForStopBackspace

class WillPopScopeForStopBackspace extends StatelessWidget {
  const WillPopScopeForStopBackspace({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress) {
          return false;
        } else {
          return true;
        }
      },
      child: child,
    );
  }
}

const kLOGTAG = "[SEBAGHOR-Flutter]";
const kLOGENABLE = true;

printLog(dynamic data) {
  if (kLOGENABLE) {
    print("$kLOGTAG: ${data.toString()}");
  }
}

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
