import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    required this.desktop,
    required this.tablet,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650 &&
          MediaQuery.of(context).size.width < MediaQuery.of(context).size.height;
  static bool isTablet(BuildContext context) =>
      (MediaQuery.of(context).size.width >= 650 &&
          MediaQuery.of(context).size.width < 1100) ||
          MediaQuery.of(context).size.width > MediaQuery.of(context).size.height;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop;
        } else if (constraints.maxWidth >= 650 ||
            constraints.maxHeight < constraints.maxWidth) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
