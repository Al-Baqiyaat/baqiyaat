import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuranSearchNotifier extends StateNotifier<String> {
  QuranSearchNotifier() : super('');

  void addQuery(String query) {
    state = query;
  }

  void clearQuery() {
    state = '';
  }
}
// -----------------------------------------------------------------------------

final quranSearchProvider =
    StateNotifierProvider<QuranSearchNotifier, String>((ref) {
  return QuranSearchNotifier();
});
