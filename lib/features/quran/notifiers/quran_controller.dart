import 'dart:convert';

import '../../../models/quran.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuranNotifier extends StateNotifier<List<Surah>> {
  QuranNotifier() : super([]);

  Future<void> loadQuran(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/jsons/quran.json');
    List<dynamic> surahsJson = json.decode(data);
    state = surahsJson.map((json) => Surah.fromJson(json)).toList();
  }

  Surah? getSurahById(int id) {
    return state.firstWhere((surah) => surah.id == id);
  }
}
// -----------------------------------------------------------------------------

final quranProvider = StateNotifierProvider<QuranNotifier, List<Surah>>((ref) {
  return QuranNotifier();
});
