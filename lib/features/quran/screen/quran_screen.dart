import 'package:baqiyaat/features/quran/notifiers/quran_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
