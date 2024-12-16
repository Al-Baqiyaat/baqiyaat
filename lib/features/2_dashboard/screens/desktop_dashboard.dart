import 'package:flutter/material.dart';

class DesktopDashboard extends StatelessWidget {
  const DesktopDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          screenWidth.toString(),
        ),
      ),
    );
  }
}
