class Surah {
  int id;
  int totalVerses;
  String surahName;
  String surahNameTranslationBn;
  String surahNameTranslationEn;
  String surahNameTransliterationBn;
  String surahNameTransliterationEn;
  String surahType;
  String surahTypeBn;
  String surahTypeEn;
  List<Verse> verses;

  Surah({
    required this.id,
    required this.totalVerses,
    required this.surahName,
    required this.surahNameTranslationBn,
    required this.surahNameTranslationEn,
    required this.surahNameTransliterationBn,
    required this.surahNameTransliterationEn,
    required this.surahType,
    required this.surahTypeBn,
    required this.surahTypeEn,
    required this.verses,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      id: json['id'],
      totalVerses: json['total_verses'],
      surahName: json['surah_name'],
      surahNameTranslationBn: json['surah_name_translation_bn'],
      surahNameTranslationEn: json['surah_name_translation_en'],
      surahNameTransliterationBn: json['surah_name_transliteration_bn'],
      surahNameTransliterationEn: json['surah_name_transliteration_en'],
      surahType: json['surah_type'],
      surahTypeBn: json['surah_type_bn'],
      surahTypeEn: json['surah_type_en'],
      verses: (json['verses'] as List).map((i) => Verse.fromJson(i)).toList(),
    );
  }
}

// -----------------------------------------------------------------------------

class Verse {
  int id;
  String verse;
  String verseTranslationBn;
  String verseTranslationEn;
  String verseTransliterationBn;
  String verseTransliterationEn;
  int verseNumber;

  Verse({
    required this.id,
    required this.verse,
    required this.verseTranslationBn,
    required this.verseTranslationEn,
    required this.verseTransliterationBn,
    required this.verseTransliterationEn,
    required this.verseNumber,
  });

  factory Verse.fromJson(Map<String, dynamic> json) {
    return Verse(
      id: json['id'],
      verse: json['verse'],
      verseTranslationBn: json['verse_translation_bn'],
      verseTranslationEn: json['verse_translation_en'],
      verseTransliterationBn: json['verse_transliteration_bn'],
      verseTransliterationEn: json['verse_transliteration_en'],
      verseNumber: json['verse_number'],
    );
  }
}
