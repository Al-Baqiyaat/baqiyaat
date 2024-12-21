import 'package:audioplayers/audioplayers.dart';
import 'package:baqiyaat/core/constants/icons.dart';
import 'package:flutter/material.dart';

import '../../../models/quran.dart';

class VerseCard extends StatefulWidget {
  const VerseCard({
    super.key,
    required this.verse,
  });

  final Verse verse;

  @override
  State<VerseCard> createState() => _VerseCardState();
}

class _VerseCardState extends State<VerseCard> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playAudio(String audioFileName) {
    _audioPlayer.play(AssetSource('audio/quran/$audioFileName.m4a'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _playAudio(widget.verse.verseNumber.toString());
      },
      child: Card.filled(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 24,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Arabic verse - always right-aligned
              Text(
                widget.verse.verse,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              // Transliteration - always left-aligned
              Text(
                '${widget.verse.id}. ${widget.verse.verseTransliterationEn}',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              // Translation - always left-aligned
              Text(
                widget.verse.verseTranslationEn,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),

        // Padding(
        //   padding: const EdgeInsets.all(12.0),
        //   child: Column(
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(
        //             widget.verse.id.toString(),
        //             style: const TextStyle(
        //               fontSize: 14,
        //             ),
        //           ),
        //           IconButton(
        //             onPressed: () {
        //               // Toggle between play and stop
        //               // if (!isPlaying) {
        //               //   playAudio();
        //               // } else {
        //               //   stopAudio();
        //               // }
        //               _playAudio(widget.verse.verseNumber.toString());
        //             },
        //             icon: Icon(CustomIcons.play),
        //           ),
        //         ],
        //       ),
        //       const SizedBox(height: 10),
        //       // Arabic verse - always right-aligned
        //       Text(
        //         widget.verse.verse,
        //         textAlign: TextAlign.right,
        //         textDirection: TextDirection.rtl,
        //         style: Theme.of(context).textTheme.headlineMedium,
        //       ),
        //       // Transliteration - always left-aligned
        //       Text(
        //         '${widget.verse.id}. ${widget.verse.verseTransliterationEn}',
        //         textAlign: TextAlign.left,
        //         style: Theme.of(context).textTheme.bodyMedium,
        //       ),
        //       // Translation - always left-aligned
        //       Text(
        //         widget.verse.verseTranslationEn,
        //         textAlign: TextAlign.left,
        //         style: Theme.of(context).textTheme.bodyMedium,
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );

    // Column(
    //   spacing: 24,
    //   crossAxisAlignment: CrossAxisAlignment.stretch,
    //   children: [
    // // Arabic verse - always right-aligned
    // Text(
    //   verse.verse,
    //   textAlign: TextAlign.right,
    //   textDirection: TextDirection.rtl,
    //   style: Theme.of(context).textTheme.headlineMedium,
    // ),
    // // Transliteration - always left-aligned
    // Text(
    //   '${verse.id}. ${verse.verseTransliterationEn}',
    //   textAlign: TextAlign.left,
    //   style: Theme.of(context).textTheme.bodyMedium,
    // ),
    // // Translation - always left-aligned
    // Text(
    //   verse.verseTranslationEn,
    //   textAlign: TextAlign.left,
    //   style: Theme.of(context).textTheme.bodyMedium,
    // ),
    //   ],
    // );
  }
}
