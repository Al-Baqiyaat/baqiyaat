import 'package:flutter/material.dart';

class TabletDashboard extends StatelessWidget {
  const TabletDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Text(
          screenWidth.toString(),
        ),
      ),
    );
  }
}
