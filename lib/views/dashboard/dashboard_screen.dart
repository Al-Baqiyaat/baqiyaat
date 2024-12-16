import 'package:flutter/material.dart';
import '../../core/responsive_layout/responsive_layout.dart';
import 'desktop_dashboard.dart';
import 'mobile_dashboard.dart';
import 'tablet_dashboard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: MobileDashboard(),
      tabletLayout: TabletDashboard(),
      desktopLayout: DesktopDashboard(),
    );
  }
}
