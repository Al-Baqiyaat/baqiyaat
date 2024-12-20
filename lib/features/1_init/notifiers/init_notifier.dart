import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/language/language_notifier.dart';
import '../../../core/utils/navigators.dart';
import '../../2_home/screens/home_screen.dart';
import '../../quran/notifiers/quran_notifier.dart';

class InitNotifier extends StateNotifier<bool> {
  final LanguageNotifier _language;
  final QuranNotifier _quran;
  // final LastReadVerseNotifier _lastReadVerse;
  InitNotifier({
    required LanguageNotifier language,
    required QuranNotifier quran,
    // required LastReadVerseNotifier lastReadVerse,
  })  : _language = language,
        _quran = quran,
        // _lastReadVerse = lastReadVerse,
        super(false);

  Future<void> init(BuildContext context) async {
    await _language.loadLanguage();
    if (context.mounted) {
      await _quran.loadQuran(context);
    }
    // await _lastReadVerse.loadLastReadVerse();
    if (context.mounted) {
      navigateAndRemoveUntil(context, HomeScreen());
    }
  }
}
// -----------------------------------------------------------------------------

final initProvider = StateNotifierProvider<InitNotifier, bool>((ref) {
  final language = ref.read(languageProvider.notifier);
  final quran = ref.read(quranProvider.notifier);
  // final lastReadVerse = ref.read(lastReadVerseProvider.notifier);
  return InitNotifier(
    language: language,
    quran: quran,
    // lastReadVerse: lastReadVerse,
  );
});
