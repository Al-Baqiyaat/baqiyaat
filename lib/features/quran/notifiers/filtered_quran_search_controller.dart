import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/quran.dart';
import 'quran_controller.dart';
import 'quran_search_controller.dart';

class FilteredQuranSearchNotifier extends StateNotifier<List<Surah>> {
  final List<Surah> _surahs;
  final String _search;

  FilteredQuranSearchNotifier({
    required List<Surah> surahs,
    required String search,
  })  : _surahs = surahs,
        _search = search,
        super([]);

  List<Surah> filterSurahs() {
    Future.delayed(const Duration(microseconds: 1), () {
      state = [];
    });
    final List<Surah> filteredSearches = [];
    for (var surah in _surahs) {
      for (var verse in surah.verses) {
        if (_doesVerseContainSearch(verse)) {
          final search = Surah(
            id: surah.id,
            totalVerses: surah.totalVerses,
            surahName: surah.surahName,
            surahNameTranslationBn: surah.surahNameTranslationBn,
            surahNameTranslationEn: surah.surahNameTranslationEn,
            surahNameTransliterationBn: surah.surahNameTransliterationBn,
            surahNameTransliterationEn: surah.surahNameTransliterationEn,
            surahType: surah.surahType,
            surahTypeBn: surah.surahTypeBn,
            surahTypeEn: surah.surahTypeEn,
            verses: surah.verses,
          );
          filteredSearches.add(search);
          continue;
        }
      }
    }
    Future.delayed(const Duration(microseconds: 1), () {
      state = filteredSearches;
    });
    return filteredSearches;
  }

  bool _doesVerseContainSearch(Verse verse) {
    return verse.verse.contains(_search) ||
        verse.verseTranslationBn.contains(_search) ||
        verse.verseTranslationEn
            .toLowerCase()
            .contains(_search.toLowerCase()) ||
        verse.verseTransliterationBn.contains(_search) ||
        verse.verseTransliterationEn
            .toLowerCase()
            .contains(_search.toLowerCase());
  }
}

// -----------------------------------------------------------------------------

final filteredQuranSearchProvider =
    StateNotifierProvider<FilteredQuranSearchNotifier, List<Surah>>((ref) {
  final surahs = ref.watch(quranProvider);
  final search = ref.watch(quranSearchProvider);
  return FilteredQuranSearchNotifier(
    surahs: surahs,
    search: search,
  );
});
