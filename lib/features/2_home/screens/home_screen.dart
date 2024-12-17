import 'package:flutter/material.dart';
import '../../../core/responsive_layout/responsive_layout.dart';
import 'desktop_home.dart';
import 'mobile_home.dart';
import 'tablet_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: MobileHome(),
      tabletLayout: TabletHome(),
      desktopLayout: DesktopHome(),
    );
  }
}
