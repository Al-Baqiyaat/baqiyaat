import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/quran.dart';

class QuranNotifier extends StateNotifier<List<Surah>> {
  QuranNotifier() : super([]);

  Future<void> loadQuran(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/jsons/quran.json');
    List<dynamic> surahsJson = json.decode(data);
    state = surahsJson.map((json) => Surah.fromJson(json)).toList();
  }

  Surah? getSurahById(int id) {
    if (id == 0) {
      return null;
    }
    return state.firstWhere((surah) => surah.id == id);
  }
}
// -----------------------------------------------------------------------------

final quranProvider = StateNotifierProvider<QuranNotifier, List<Surah>>((ref) {
  return QuranNotifier();
});
