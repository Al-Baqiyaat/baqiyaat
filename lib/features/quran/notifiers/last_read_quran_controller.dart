import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/quran.dart';
import 'quran_controller.dart';

class LastreadVerseNotifier extends StateNotifier<LastReadVerse?> {
  final QuranNotifier _quran;
  LastreadVerseNotifier({required QuranNotifier quran})
      : _quran = quran,
        super(null);

  static const String surahIdKey = 'surahId';
  static const String verseIdKey = 'verseId';

  void saveSurahVerseToSharedPreferences(int surahId, int verseId) {
    _saveSurahVerseToSharedPreferences(surahId, verseId);
  }

  Future<void> _saveSurahVerseToSharedPreferences(
      int surahId, int verseId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(surahIdKey, surahId);
    prefs.setInt(verseIdKey, verseId);
    final surah = _quran.getSurahById(surahId);
    state = LastReadVerse(surah: surah!, verseId: verseId);
  }

  Future<LastReadVerse?> getSurahFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? surahId = prefs.getInt(surahIdKey);
    int? verseId = prefs.getInt(verseIdKey);
    if (surahId != null && verseId != null) {
      Surah? surah = _quran.getSurahById(surahId);
      if (surah != null) {
        final gottenSura = _quran.getSurahById(surahId);
        state = LastReadVerse(surah: gottenSura!, verseId: verseId);
        return LastReadVerse(surah: surah, verseId: verseId);
      }
    }
    return null;
  }

  void updateState() {
    final newState = state;
    state = newState;
  }
}
// -----------------------------------------------------------------------------

final lastReadVerseProvider =
    StateNotifierProvider<LastreadVerseNotifier, LastReadVerse?>((ref) {
  final quranController = ref.watch(quranProvider.notifier);
  return LastreadVerseNotifier(quran: quranController);
});
