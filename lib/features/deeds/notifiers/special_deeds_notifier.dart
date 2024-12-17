import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../models/deed.dart';

class SpecialDeedsController extends StateNotifier<List<Deed>> {
  SpecialDeedsController()
      : super([
          Deed(
            id: 0,
            titleEn: 'Observe Monday Fast',
            titleBn: 'সোমবার রোজা রাখুন',
            dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
            day: DateTime.now().day,
            month: DateTime.now().month,
            year: DateTime.now().year,
          ),
          Deed(
            id: 0,
            titleEn: 'Observe Thursday Fast',
            titleBn: 'বৃহস্পতিবার রোজা রাখুন',
            dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
            day: DateTime.now().day,
            month: DateTime.now().month,
            year: DateTime.now().year,
          ),
          Deed(
            id: 0,
            titleEn: 'Read Surah Al-Qaf after Jummah',
            titleBn: 'জুমার পর সূরা আল কাফ পাঠ করুন',
            dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
            day: DateTime.now().day,
            month: DateTime.now().month,
            year: DateTime.now().year,
          ),
        ]);

  Deed? getSpecialDeed(DateTime date) {
    if (DateFormat('EEEE').format(DateTime.now()) == 'Monday') {
      return state[0];
    } else if (DateFormat('EEEE').format(DateTime.now()) == 'Thursday') {
      return state[1];
    } else if (DateFormat('EEEE').format(DateTime.now()) == 'Friday') {
      return state[2];
    } else {
      return null;
    }
  }
}
// -----------------------------------------------------------------------------

final specialDeedsProvider =
    StateNotifierProvider<SpecialDeedsController, List<Deed>>((ref) {
  return SpecialDeedsController();
});
