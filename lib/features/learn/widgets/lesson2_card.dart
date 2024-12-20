import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/icons.dart';

class Lesson2Card extends StatefulWidget {
  const Lesson2Card({
    super.key,
    required this.itemValue,
    required this.itemKey,
  });

  final String itemValue;
  final String itemKey;

  @override
  State<Lesson2Card> createState() => _Lesson2CardState();
}

class _Lesson2CardState extends State<Lesson2Card> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playAudio(String audioFileName) {
    _audioPlayer.play(AssetSource('audio/lessons/lesson2/$audioFileName.mp3'));
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
        _playAudio(widget.itemKey);
      },
      child: Card(
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: Text(
                      widget.itemKey,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    CustomIcons.play,
                  ),
                ],
              ),
              Expanded(
                child: Card.outlined(
                  child: Center(
                    child: Text(
                      widget.itemValue,
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
