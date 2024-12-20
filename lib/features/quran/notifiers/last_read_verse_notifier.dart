// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../models/last_read_verse.dart';

// // StateNotifier
// class LastReadVerseNotifier extends StateNotifier<LastReadVerse?> {
//   LastReadVerseNotifier() : super(null) {
//     loadLastReadVerse();
//   }

//   void saveSurahVerseToSharedPreferences(int surahId, int verseId) {
//     saveLastReadVerse(surahId, verseId);
//   }

//   // Load last read verse from persistent storage
//   Future<void> loadLastReadVerse() async {
//     final prefs = await SharedPreferences.getInstance();
//     final surahId = prefs.getInt('lastSurahId');
//     final verseId = prefs.getInt('lastVerseId');
//     if (surahId != null && verseId != null) {
//       state = LastReadVerse(surahId: surahId, verseId: verseId);
//     }
//   }

//   // Save last read verse to persistent storage
//   Future<void> saveLastReadVerse(int surahId, int verseId) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('lastSurahId', surahId);
//     await prefs.setInt('lastVerseId', verseId);
//     state = LastReadVerse(surahId: surahId, verseId: verseId);
//   }
// }

// // Provider for LastReadVerseNotifier
// final lastReadVerseProvider =
//     StateNotifierProvider<LastReadVerseNotifier, LastReadVerse?>(
//   (ref) => LastReadVerseNotifier(),
// );
