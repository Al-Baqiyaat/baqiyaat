// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:search_highlight_text/search_highlight_text.dart';

// import '../../../core/language/language_notifier.dart';
// import '../notifiers/filtered_quran_search_controller.dart';
// import '../notifiers/quran_search_controller.dart';

// class SearchEntireQuranView extends ConsumerStatefulWidget {
//   static route() => MaterialPageRoute(
//         builder: (context) => const SearchEntireQuranView(),
//       );
//   const SearchEntireQuranView({super.key});

//   @override
//   ConsumerState<SearchEntireQuranView> createState() =>
//       _SearchEntireQuranViewState();
// }

// class _SearchEntireQuranViewState extends ConsumerState<SearchEntireQuranView> {
//   final _searchController = TextEditingController();

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     ref.watch(quranSearchProvider);
//     final language = ref.watch(languageProvider);
//     final searchedSurahs =
//         ref.read(filteredQuranSearchProvider.notifier).filterSurahs();
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           Card(
//             child: ListTile(
//               leading: const Icon(CupertinoIcons.search),
//               trailing: GestureDetector(
//                 onTap: () {
//                   ref.read(quranSearchProvider.notifier).clearQuery();
//                   setState(() {
//                     _searchController.clear();
//                   });
//                 },
//                 child: const Icon(Icons.close),
//               ),
//               title: TextField(
//                 controller: _searchController,
//                 onTapOutside: (event) {
//                   FocusManager.instance.primaryFocus!.unfocus();
//                 },
//                 decoration: const InputDecoration(
//                   contentPadding: EdgeInsets.zero,
//                   border: InputBorder.none,
//                 ),
//                 onChanged: (query) {
//                   ref.read(quranSearchProvider.notifier).addQuery(query);
//                 },
//               ),
//             ),
//           ),
//           Expanded(
//             child: SearchTextInheritedWidget(
//               searchText: _searchController.text,
//               highlightColor: Colors.red,
//               child: ListView.builder(
//                 itemCount: searchedSurahs.length,
//                 itemBuilder: (context, index) {
//                   final surah = searchedSurahs[index];
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           SearchHighlightText(
//                                             language == Language.bn
//                                                 ? surah.surahNameTransliterationBn
//                                                 : surah.surahNameTransliterationEn,
//                                             style: const TextStyle(
//                                               fontSize: 18,
//                                             ),
//                                           ),
//                                           const Text(
//                                             '  -  ',
//                                             style: TextStyle(
//                                               fontSize: 18,
//                                             ),
//                                           ),
//                                           SearchHighlightText(
//                                             language == Language.bn
//                                                 ? ref
//                                                     .read(
//                                                         languageProvider
//                                                             .notifier)
//                                                     .convertNumbersEnglishToBangla(
//                                                         surah.verse.id
//                                                             .toString())
//                                                 : surah.verse.id.toString(),
//                                             style: const TextStyle(
//                                               fontSize: 14,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       SearchHighlightText(
//                                         surah.name,
//                                         style: const TextStyle(
//                                           fontSize: 18,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   const Divider(),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                   child: SearchHighlightText(
//                                     surah.verse.text,
//                                     textDirection: TextDirection.rtl,
//                                     style: const TextStyle(
//                                       fontSize: 32,
//                                     ),
//                                   ),
//                                   // Txt(
//                                   //   verse.text,
//                                   //   fontSize: 22,
//                                   //   color: Palette.green,
//                                   //   textDirection: TextDirection.rtl,
//                                   // ),
//                                 ),
//                               ],
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 16),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Expanded(
//                                     child: SearchHighlightText(
//                                       !isEnglish
//                                           ? surah.verse.transliterationBn
//                                           : surah.verse.transliterationEn,
//                                       style: const TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                     // Txt(
//                                     //   !languageIsEnglish
//                                     //       ? verse.transliterationBn
//                                     //       : verse.transliterationEn,
//                                     //   fontSize: 20,
//                                     //   fontWeight: FontWeight.w500,
//                                     // ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                   child: SearchHighlightText(
//                                 language == Language.bn
//                                         ? surah.verse.translationBn
//                                         : surah.verse.translationEn,
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                   // Txt(
//                                   //   !languageIsEnglish
//                                   //       ? verse.translationBn
//                                   //       : verse.translationEn,
//                                   //   fontSize: 16,
//                                   // ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
