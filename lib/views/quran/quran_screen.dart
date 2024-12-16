import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/quran/quran_controller.dart';

class QuranScreen extends ConsumerWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quran = ref.read(quranProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView.builder(
          itemCount: quran.length,
          itemBuilder: (context, index) {
            final surah = quran[index];
            return ListTile(
              title: Text(surah.surahName),
            );
          },
        ),
      ),
    );
  }
}
