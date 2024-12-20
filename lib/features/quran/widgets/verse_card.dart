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
    return Column(
      spacing: 24,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Arabic verse - always right-aligned
        Text(
          verse.verse,
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        // Transliteration - always left-aligned
        Text(
          '${verse.id}. ${verse.verseTransliterationEn}',
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        // Translation - always left-aligned
        Text(
          verse.verseTranslationEn,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
