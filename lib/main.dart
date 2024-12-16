import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'views/init/init_screen.dart';

void main() {
  runApp(ProviderScope(child: BaqiyaatApp()));
}

class BaqiyaatApp extends StatelessWidget {
  const BaqiyaatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baqiyaat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: InitScreen(),
    );
  }
}
