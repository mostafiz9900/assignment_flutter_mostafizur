import 'package:flutter/material.dart';

class CustomLoaderWidget extends StatelessWidget {
  const CustomLoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        // child: SpinKitCircle(
        //   color: AppColors.primaryColor,
        //   size: 50.0,
        // )
      child: Text("Loading......"),
    );
  }
}