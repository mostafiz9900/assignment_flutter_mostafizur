import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

 const ResponsiveLayout({
   super.key,
    required this.largeScreen,
    required this.mediumScreen,
    required this.smallScreen,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 1200) {
          return largeScreen;
        } else if (constraints.maxWidth > 600) {
          return mediumScreen;
        } else {
          return smallScreen;
        }
      },
    );
  }
}