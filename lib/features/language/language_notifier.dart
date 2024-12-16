import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Enum for Language
enum AppLanguage { en, bn }

class LanguageNotifier extends StateNotifier<AppLanguage> {
  LanguageNotifier() : super(AppLanguage.en) {
    loadLanguage();
  }

  static const _key = 'language';

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(_key)) {
      final savedValue = prefs.getString(_key);
      state = AppLanguage.values.firstWhere(
        (lang) => lang.toString() == savedValue,
        orElse: () => AppLanguage.en,
      );
    } else {
      state = AppLanguage.en; // Default language
    }
  }

  Future<void> setLanguage(AppLanguage language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, language.toString());
    state = language;
  }

  // Arabic to English
  String convertNumbersArabicToEnglish(String arabicNumber) {
    final Map<String, String> englishDigits = {
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
    };
    String englishNumber = '';
    for (int i = 0; i < arabicNumber.length; i++) {
      String digit = arabicNumber[i];
      if (englishDigits.containsKey(digit)) {
        englishNumber += englishDigits[digit]!;
      } else {
        englishNumber += digit;
      }
    }
    return englishNumber;
  }

  // English to Bengali
  String convertNumbersEnglishToBangla(String englishNumber) {
    final Map<String, String> banglaDigits = {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
    };
    String banglaNumber = '';
    for (int i = 0; i < englishNumber.length; i++) {
      String digit = englishNumber[i];
      if (banglaDigits.containsKey(digit)) {
        banglaNumber += banglaDigits[digit]!;
      } else {
        banglaNumber += digit;
      }
    }
    return banglaNumber;
  }
}

// -----------------------------------------------------------------------------

final languageProvider =
    StateNotifierProvider<LanguageNotifier, AppLanguage>((ref) {
  return LanguageNotifier();
});
