import 'package:baqiyaat/core/notifiers/language_notifier.dart';

import '../../../core/utils/navigators.dart';
import '../../2_dashboard/screens/dashboard_screen.dart';
import '../../quran/notifiers/quran_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitNotifier extends StateNotifier<bool> {
  final LanguageNotifier _language;
  final QuranNotifier _quran;
  InitNotifier(
      {required LanguageNotifier language, required QuranNotifier quran})
      : _language = language,
        _quran = quran,
        super(false);

  Future<void> init(BuildContext context) async {
    await _language.loadLanguage();
    if (context.mounted) {
      await _quran.loadQuran(context);
    }
    if (context.mounted) {
      navigateAndRemoveUntil(context, DashboardScreen());
    }
  }
}
// -----------------------------------------------------------------------------

final initProvider = StateNotifierProvider<InitNotifier, bool>((ref) {
  final language = ref.read(languageProvider.notifier);
  final quran = ref.read(quranProvider.notifier);
  return InitNotifier(
    language: language,
    quran: quran,
  );
});
