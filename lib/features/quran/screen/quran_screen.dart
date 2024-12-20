import 'package:baqiyaat/core/utils/navigators.dart';

import '../../../core/language/language_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/quran_notifier.dart';
import 'surah_screen.dart';

class QuranScreen extends ConsumerWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProvider);
    final quran = ref.read(quranProvider);
    // final lastReadVerse = ref.watch(lastReadVerseProvider);
    // final lastReadSurah = ref
    //     .read(quranProvider.notifier)
    //     .getSurahById(lastReadVerse == null ? 0 : lastReadVerse!.surahId);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: quran.length,
        itemBuilder: (context, index) {
          final surah = quran[index];
          // return Card(
          //   child: ListTile(
          //     onTap: () {
          //       navigate(
          //         context,
          //         SurahScreen(
          //           surahId: surah.id,
          //         ),
          //       );
          //     },
          //     leading: Text(surah.id.toString()),
          //     title: Text(surah.surahNameTransliterationEn),
          //     subtitle: Text(surah.surahNameTranslationEn),
          //     trailing: Text(
          //       surah.surahName,
          //       style: Theme.of(context).textTheme.titleLarge,
          //     ),
          //   ),
          // );

          return Card.filled(
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(12),
            // ),
            child: ListTile(
              onTap: () {
                navigate(
                  context,
                  SurahScreen(
                    surahId: surah.id,
                  ),
                );
              },
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: Text(
                  surah.id.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                surah.surahNameTransliterationEn,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surah.surahNameTranslationEn,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${surah.surahTypeEn} • ${surah.totalVerses} Verses',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    surah.surahName,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    surah.surahTypeBn,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[700],
                        ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      // persistentFooterButtons: [
      //   lastReadSurah == null
      //       ? SizedBox.shrink()
      //       : Card.filled(
      //           child: ListTile(
      //             title: Text(
      //               'Last Read',
      //               style: const TextStyle(fontSize: 14),
      //             ),
      //             subtitle: Text(
      //               '${lastReadSurah.surahNameTransliterationEn}: ${lastReadVerse!.verseId}',
      //               style: const TextStyle(
      //                   fontSize: 24, fontWeight: FontWeight.w500),
      //             ),
      //             trailing: IconButton(
      //               onPressed: () {
      //                 navigate(
      //                   context,
      //                   SurahScreen(
      //                     surahId: lastReadVerse.surahId,
      //                     verseId: lastReadVerse.verseId,
      //                   ),
      //                 );
      //               },
      //               icon: const Icon(
      //                 Icons.arrow_forward,
      //               ),
      //             ),
      //           ),
      //         ),
      // ],
    );
  }
}
