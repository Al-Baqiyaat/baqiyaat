import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget? tabletLayout;
  final Widget desktopLayout;

  const ResponsiveLayout({
    super.key,
    required this.mobileLayout,
    this.tabletLayout,
    required this.desktopLayout,
  });

  @override
  Widget build(BuildContext context) {
    const double mobileBreakpoint = 650;
    const double tabletBreakpoint = 1100;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileBreakpoint) {
          // Mobile layout
          return mobileLayout;
        } else if (constraints.maxWidth < tabletBreakpoint) {
          // Tablet layout or fallback to mobile
          return tabletLayout ?? mobileLayout;
        } else {
          // Desktop layout
          return desktopLayout;
        }
      },
    );
  }
}
