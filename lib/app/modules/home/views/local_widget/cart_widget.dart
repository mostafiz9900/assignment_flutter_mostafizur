import 'package:flutter/material.dart';

import '../../../../app_pkg.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Cart page',style: TextStyle(color: hexToColor('#222455')),),),
      body: const Center(child: Text('More Widget')),
    );
  }
}
