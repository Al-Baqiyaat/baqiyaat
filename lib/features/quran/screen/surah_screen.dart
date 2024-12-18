import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../core/language/language_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/last_read_verse_notifier.dart';
import '../notifiers/quran_notifier.dart';
import '../widgets/surah_card.dart';

class SurahScreen extends ConsumerStatefulWidget {
  final int? surahId;
  final int? verseId;
  const SurahScreen({
    super.key,
    this.surahId = 1,
    this.verseId,
  });

  @override
  ConsumerState<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends ConsumerState<SurahScreen> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
    itemPositionsListener.itemPositions.addListener(_scrollListener);

    // Scroll to the specified verse after the widget builds
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.verseId != null) {
        final index =
            widget.verseId! - 1; // Assuming 1-based indexing for verses
        itemScrollController.jumpTo(index: index);
      }
    });
  }

  @override
  void dispose() {
    itemPositionsListener.itemPositions.removeListener(_scrollListener);
    super.dispose();
  }

  int? _previousIndex; // Keeps track of the last recorded index
  void _scrollListener() {
    final positions = itemPositionsListener.itemPositions.value;
    int lastCrossedIndex = -1;

    // Loop through the positions of all the visible items
    for (var position in positions) {
      if (position.itemLeadingEdge < 0.8) {
        // Threshold for visibility
        if (position.index != 0) {
          lastCrossedIndex =
              position.index; // Get the index of the last visible item
        }
      }
    }

    // Update if the index has changed and is valid
    if (lastCrossedIndex != -1 && _previousIndex != lastCrossedIndex) {
      _previousIndex = lastCrossedIndex;

      // Save the last read verse to the state provider
      ref.read(lastReadVerseProvider.notifier).saveLastReadVerse(
            widget.surahId!,
            lastCrossedIndex,
          );

      print(lastCrossedIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    final language = ref.watch(languageProvider);
    final surah =
        ref.read(quranProvider.notifier).getSurahById(widget.surahId!);

    return Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.white,
          child: ScrollablePositionedList.separated(
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
            itemCount: surah!.verses.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              final verse = surah.verses[index];
              return SurahCard(verse: verse);
            },
          ),
        ));
  }
}
