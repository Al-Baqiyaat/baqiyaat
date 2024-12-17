import 'package:flutter/material.dart';

class TabletHome extends StatelessWidget {
  const TabletHome({super.key});

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
