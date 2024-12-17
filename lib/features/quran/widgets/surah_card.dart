import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/language/language_notifier.dart';
import '../../../models/quran.dart';

class SurahCard extends StatefulWidget {
  final bool isEnglish;
  final WidgetRef ref;
  final int surahId;
  final Verse verse;
  const SurahCard({
    super.key,
    required this.isEnglish,
    required this.ref,
    required this.surahId,
    required this.verse,
  });

  @override
  SurahCardState createState() => SurahCardState();
}

class SurahCardState extends State<SurahCard> {
  late bool isPlaying;
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    isPlaying = false;
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      !widget.isEnglish
                          ? widget.ref
                              .read(languageProvider.notifier)
                              .convertNumbersEnglishToBangla(
                                  widget.verse.id.toString())
                          : widget.verse.id.toString(),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    // Toggle between play and stop
                    if (!isPlaying) {
                      playAudio();
                    } else {
                      stopAudio();
                    }
                  },
                  icon: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    widget.verse.verse,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  // Txt(
                  //   verse.text,
                  //   fontSize: 22,
                  //   color: Palette.green,
                  //   textDirection: TextDirection.rtl,
                  // ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      !widget.isEnglish
                          ? widget.verse.verseTransliterationBn
                          : widget.verse.verseTransliterationEn,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // Txt(
                    //   !languageIsEnglish
                    //       ? verse.transliterationBn
                    //       : verse.transliterationEn,
                    //   fontSize: 20,
                    //   fontWeight: FontWeight.w500,
                    // ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    !widget.isEnglish
                        ? widget.verse.verseTranslationBn
                        : widget.verse.verseTranslationEn,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  // Txt(
                  //   !languageIsEnglish
                  //       ? verse.translationBn
                  //       : verse.translationEn,
                  //   fontSize: 16,
                  // ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void playAudio() async {
    // final response = await http.get(Uri.parse(
    //     'https://api.alquran.cloud/v1/ayah/${widget.surahId}:${widget.verse.id}/ar.alafasy'));
    // final decodedData = jsonDecode(response.body);
    // final audioUrl = decodedData['data']['audio'];
    // setState(() {
    //   isPlaying = true;
    // });

    // await audioPlayer.play(UrlSource(audioUrl));
  }

  void stopAudio() async {
    await audioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }
}
