import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/icons.dart';
import '../../../models/lessons.dart';

class Lesson1Card extends StatefulWidget {
  final Alphabet alphabet;
  const Lesson1Card({
    super.key,
    required this.alphabet,
  });

  @override
  Lesson1CardState createState() => Lesson1CardState();
}

class Lesson1CardState extends State<Lesson1Card> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playAudio(String audioFileName) {
    _audioPlayer.play(AssetSource('audio/lessons/lesson1/$audioFileName.mp3'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text('Final'),
                    Text(
                      widget.alphabet.endForm,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Middle'),
                    Text(
                      widget.alphabet.middleForm,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Initial'),
                    Text(
                      widget.alphabet.initialForm,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                SizedBox(
                  width: 100,
                  child: Card.outlined(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          widget.alphabet.isolatedForm,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(fontSize: 64),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  spacing: 16,
                  children: [
                    Text(
                      widget.alphabet.pronunciationTransliterationEn,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.alphabet.pronunciationTransliterationBn,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.alphabet.pronunciation,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    _playAudio(widget.alphabet.id);
                  },
                  icon: Icon(CustomIcons.play),
                  iconSize: 32,
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class AlphabetCard extends StatelessWidget {
//   final Alphabet alphabet;
//   const AlphabetCard({
//     super.key,
//     required this.alphabet,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(8.0),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     const Text('Final'),
//                     Text(
//                       alphabet.endForm,
//                       style: Theme.of(context).textTheme.headlineLarge,
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     const Text('Middle'),
//                     Text(
//                       alphabet.middleForm,
//                       style: Theme.of(context).textTheme.headlineLarge,
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     const Text('Initial'),
//                     Text(
//                       alphabet.initialForm,
//                       style: Theme.of(context).textTheme.headlineLarge,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   width: 100,
//                   child: Card.outlined(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Center(
//                         child: Text(
//                           alphabet.isolatedForm,
//                           style: Theme.of(context)
//                               .textTheme
//                               .headlineLarge!
//                               .copyWith(fontSize: 64),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Row(
//                   spacing: 12,
//                   children: [
//                     Text(
//                       alphabet.pronunciationTransliterationEn,
//                       style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black87,
//                           ),
//                       textAlign: TextAlign.start,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     Text(
//                       alphabet.pronunciationTransliterationBn,
//                       style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black87,
//                           ),
//                       textAlign: TextAlign.start,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     Text(
//                       alphabet.pronunciation,
//                       style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black87,
//                           ),
//                       textAlign: TextAlign.start,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//                 IconButton(
//                   onPressed: () {},
//                   icon: Icon(CustomIcons.play),
//                   iconSize: 32,
//                   padding: EdgeInsets.zero,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
