import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../models/deed.dart';

class DailyDeedsController extends StateNotifier<List<Deed>> {
  DailyDeedsController()
      : super([
          Deed(
            id: 1,
            titleEn: 'Pray Tahajjud',
            titleBn: 'তাহাজ্জুদ কায়েম করুন',
            dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
            day: DateTime.now().day,
            month: DateTime.now().month,
            year: DateTime.now().year,
          ),
          Deed(
            id: 22, // it is 22 because it is linked to adhkar, dont change it
            titleEn: 'Morning adhkar (check duas)',
            titleBn: 'সকালের আধকার করুন (দোয়া চেক করুন)',
            dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
            day: DateTime.now().day,
            month: DateTime.now().month,
            year: DateTime.now().year,
          ),
          Deed(
            id: 3,
            titleEn: 'Read, understand and memorize 1 ayah from Al-Quran',
            titleBn: 'আল- কোরআনের ১টি আয়াত পড়ুন, বুঝুন এবং মুখস্থ করুন',
            dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
            day: DateTime.now().day,
            month: DateTime.now().month,
            year: DateTime.now().year,
          ),
          Deed(
            id: 4,
            titleEn: 'Dont insult or talk bad to or about anyone',
            titleBn: 'কাউকে অপমান বা খারাপ কথা বলবেন না',
            dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
            day: DateTime.now().day,
            month: DateTime.now().month,
            year: DateTime.now().year,
          ),
          Deed(
            id: 5,
            titleEn: 'Try to be the first to give salam to everyone',
            titleBn: 'সবার আগে সালাম দেওয়ার চেষ্টা করুন',
            dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
            day: DateTime.now().day,
            month: DateTime.now().month,
            year: DateTime.now().year,
          ),
          Deed(
            id: 66, // it is 66 because it is linked to adhkar, dont change it
            titleEn: 'Evening adhkar (check duas)',
            titleBn: 'সন্ধ্যার আধকার করুন (দোয়া চেক করুন)',
            dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
            day: DateTime.now().day,
            month: DateTime.now().month,
            year: DateTime.now().year,
          ),
          Deed(
            id: 7,
            titleEn: 'Establish 5 fard prayers',
            titleBn: '৫টি ফরজ নামাজ কায়েম করুন',
            dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
            day: DateTime.now().day,
            month: DateTime.now().month,
            year: DateTime.now().year,
          ),
          Deed(
            id: 8,
            titleEn: 'Read Ayat-Al Kursi after every fard prayers',
            titleBn: 'প্রত্যেক ফরজ নামাজের পর আয়াতুল কুরসি পড়ুন',
            dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
            day: DateTime.now().day,
            month: DateTime.now().month,
            year: DateTime.now().year,
          ),
          Deed(
            id: 9,
            titleEn: 'Establish all 12 Muakkadah sunnah prayers',
            titleBn: '১২টি মুয়াক্কাদা সুন্নত নামাজ কায়েম করুন',
            dayOfWeek: DateFormat('EEEE').format(DateTime.now()),
            day: DateTime.now().day,
            month: DateTime.now().month,
            year: DateTime.now().year,
          ),
        ]);

  Deed getDeedById(int id) {
    return state.firstWhere(
      (deed) => deed.id == id,
    );
  }
}
// -----------------------------------------------------------------------------

final dailyDeedsProvider =
    StateNotifierProvider<DailyDeedsController, List<Deed>>((ref) {
  return DailyDeedsController();
});
