import 'package:assignment_flutter_mostafizur/app/app_pkg.dart';
import 'package:flutter/material.dart';

class MoreWidget extends StatelessWidget {
  const MoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('More page',style: TextStyle(color: hexToColor('#222455')),),),
      body: const Center(child: Text('MoreWidget')),
    );
  }
}
