import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/language/language_notifier.dart';
import '../notifiers/daily_deeds_notifier.dart';
import '../notifiers/deed_notifier.dart';
import '../notifiers/special_deeds_notifier.dart';
import '../widgets/deed_tile.dart';

class DeedsScreen extends ConsumerWidget {
  const DeedsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProvider);
    final dailyDeeds = ref.read(dailyDeedsProvider);
    final specialDeed =
        ref.read(specialDeedsProvider.notifier).getSpecialDeed(DateTime.now());
    ref.watch(deedsProvider);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          specialDeed == null
              ? const SizedBox.shrink()
              : DeedTile(deed: specialDeed),
          Expanded(
            child: ListView.builder(
              itemCount: dailyDeeds.length,
              itemBuilder: (context, index) {
                final deed = dailyDeeds[index];
                return DeedTile(deed: deed);
              },
            ),
          ),
        ],
      ),
    );
  }
}
