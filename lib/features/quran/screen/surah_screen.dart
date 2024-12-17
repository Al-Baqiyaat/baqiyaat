import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/language/language_notifier.dart';
import '../../../models/quran.dart';
import '../notifiers/last_read_quran_controller.dart';
import '../widgets/surah_card.dart';

class SurahScreen extends ConsumerStatefulWidget {
  final Surah surah;
  final int verseId;
  const SurahScreen({
    super.key,
    required this.surah,
    this.verseId = 0,
  });

  @override
  SurahScreenState createState() => SurahScreenState();
}

class SurahScreenState extends ConsumerState<SurahScreen> {
  late bool isPlaying;
  late AudioPlayer audioPlayer;

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
    isPlaying = false;
    audioPlayer = AudioPlayer();
    itemPositionsListener.itemPositions.addListener(_scrollListener);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    itemPositionsListener.itemPositions.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    final positions = itemPositionsListener.itemPositions.value;
    int lastCrossedIndex = -1;

    for (var position in positions) {
      if (position.itemLeadingEdge < 0.8) {
        if (position.index != 0) {
          lastCrossedIndex = position.index;
        }
      } else {
        break;
      }
    }

    if (lastCrossedIndex != -1) {
      ref
          .read(lastReadVerseProvider.notifier)
          .saveSurahVerseToSharedPreferences(widget.surah.id, lastCrossedIndex);
    }
  }

  void playAudio() async {
    setState(() {
      isPlaying = true;
    });

    await audioPlayer.play(UrlSource(
        'https://download.quranicaudio.com/qdc/mahmood_khaleel_al-husaree_doori/murattal/${widget.surah.id}.mp3'));
  }

  void stopAudio() async {
    await audioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final language = ref.watch(languageProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ref.read(lastReadVerseProvider.notifier).updateState();
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
        title: Text(
          language == Language.bn
              ? widget.surah.surahNameTransliterationBn
              : widget.surah.surahNameTransliterationEn,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 6, right: 6),
        child: ScrollablePositionedList.separated(
          initialScrollIndex: widget.verseId,
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
          itemCount: widget.surah.verses.length + 1,
          separatorBuilder: (context, index) => const SizedBox(height: 0),
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // SvgPicture.asset(Svgs.surahCard),
                      Positioned(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, bottom: 12, top: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    language == Language.bn
                                        ? widget
                                            .surah.surahNameTransliterationBn
                                        : widget
                                            .surah.surahNameTransliterationEn,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  // Txt(
                                  //   !languageIsEnglish
                                  //       ? widget.surah.transliteratioBn
                                  //       : widget.surah.transliterationEn,
                                  //   color: Palette.white,
                                  //   fontSize: 24,
                                  //   fontWeight: FontWeight.w500,
                                  // ),
                                  // Txt(
                                  //   widget.surah.name,
                                  //   color: Palette.white,
                                  //   fontSize: 24,
                                  //   fontWeight: FontWeight.w500,
                                  // ),
                                  Text(
                                    widget.surah.surahName,
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    language == Language.bn
                                        ? widget.surah.surahNameTranslationBn
                                        : widget.surah.surahNameTranslationEn,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  // Txt(
                                  //   !languageIsEnglish
                                  //       ? widget.surah.translationBn
                                  //       : widget.surah.translationEn,
                                  //   color: Palette.white,
                                  //   fontSize: 18,
                                  // ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    language == Language.bn
                                        ? 'মোট আয়াত: ${ref.read(languageProvider.notifier).convertNumbersEnglishToBangla(widget.surah.verses.length.toString())}'
                                        : 'Total Verse: ${widget.surah.verses.length}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  // !hasInternet
                                  //     ? const SizedBox.shrink()
                                  //     : IconButton(
                                  //         onPressed: () {
                                  //           // Toggle between play and stop
                                  //           if (!isPlaying) {
                                  //             playAudio();
                                  //           } else {
                                  //             stopAudio();
                                  //           }
                                  //         },
                                  //         icon: Icon(isPlaying
                                  //             ? Icons.stop
                                  //             : Icons.play_arrow),
                                  //       ),
                                  // -------------------------------------------
                                  // Txt(
                                  //   !languageIsEnglish
                                  //       ? 'মোট আয়াত: ${ref.read(languageIsEnglishProvider.notifier).convertEnglishToBangla(widget.surah.verses.length.toString())}'
                                  //       : 'Total Verse: ${widget.surah.verses.length}',
                                  //   color: Palette.white,
                                  //   fontSize: 18,
                                  // ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              const Divider(),
                              const SizedBox(height: 4),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              final verse = widget.surah.verses[index - 1];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SurahCard(
                  isEnglish: language == Language.bn,
                  ref: ref,
                  surahId: widget.surah.id,
                  verse: verse,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
