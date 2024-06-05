import 'package:flutter/material.dart';

class MoreWidget extends StatelessWidget {
  const MoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('More page'),),
      body: Text('MoreWidget'),
    );
  }
}
