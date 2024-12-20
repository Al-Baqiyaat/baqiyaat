class Alphabet {
  final String id;
  final String isolatedForm;
  final String initialForm;
  final String middleForm;
  final String endForm;
  final String pronunciation;
  final String pronunciationTransliterationBn;
  final String pronunciationTransliterationEn;
  Alphabet({
    required this.id,
    required this.isolatedForm,
    required this.initialForm,
    required this.middleForm,
    required this.endForm,
    required this.pronunciation,
    required this.pronunciationTransliterationBn,
    required this.pronunciationTransliterationEn,
  });
}
// -----------------------------------------------------------------------------

class GroupedAlphabet {
  final String id;
  final String text;
  GroupedAlphabet({
    required this.id,
    required this.text,
  });
}
