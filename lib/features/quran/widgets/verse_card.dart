import 'package:baqiyaat/core/constants/icons.dart';
import 'package:flutter/material.dart';

import '../../../models/quran.dart';

class VerseCard extends StatelessWidget {
  const VerseCard({
    super.key,
    required this.verse,
  });

  final Verse verse;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  verse.id.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Toggle between play and stop
                    // if (!isPlaying) {
                    //   playAudio();
                    // } else {
                    //   stopAudio();
                    // }
                  },
                  icon: Icon(CustomIcons.play),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    verse.verse,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      verse.verseTransliterationEn,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    verse.verseTranslationEn,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    // Column(
    //   spacing: 24,
    //   crossAxisAlignment: CrossAxisAlignment.stretch,
    //   children: [
    //     // Arabic verse - always right-aligned
    //     Text(
    //       verse.verse,
    //       textAlign: TextAlign.right,
    //       textDirection: TextDirection.rtl,
    //       style: Theme.of(context).textTheme.headlineMedium,
    //     ),
    //     // Transliteration - always left-aligned
    //     Text(
    //       '${verse.id}. ${verse.verseTransliterationEn}',
    //       textAlign: TextAlign.left,
    //       style: Theme.of(context).textTheme.bodyMedium,
    //     ),
    //     // Translation - always left-aligned
    //     Text(
    //       verse.verseTranslationEn,
    //       textAlign: TextAlign.left,
    //       style: Theme.of(context).textTheme.bodyMedium,
    //     ),
    //   ],
    // );
  }
}
