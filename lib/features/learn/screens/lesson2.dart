import 'package:flutter/material.dart';

import '../widgets/lesson2_card.dart';

class Lesson2Screen extends StatelessWidget {
  const Lesson2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, Map<String, String>> groupedAlphabets = {
      "1": {"text": "جعل"},
      "2": {"text": "أجذ"},
      "3": {"text": "أذن"},
      "4": {"text": "أمر"},
      "5": {"text": "بخل"},
      "6": {"text": "جمع"},
      "7": {"text": "حسد"},
      "8": {"text": "حشر"},
      "9": {"text": "خشي"},
      "10": {"text": "خلق"},
      "11": {"text": "ذكر"},
      "12": {"text": "عبس"},
      "13": {"text": "عدل"},
      "14": {"text": "قتل"},
      "15": {"text": "شرب"},
      "16": {"text": "قري"},
      "17": {"text": "حمق"},
      "18": {"text": "يقظ"},
      "19": {"text": "شغل"},
      "20": {"text": "لحس"},
      "21": {"text": "تلف"},
      "22": {"text": "خلق"},
      "23": {"text": "دخل"},
      "24": {"text": "ذعر"},
      "25": {"text": "صقل"},
      "26": {"text": "طرب"},
      "27": {"text": "قعد"},
      "28": {"text": "ﺑﺌﺲ"},
      "29": {"text": "تعب"},
      "30": {"text": "متن"},
      "31": {"text": "ركب"},
      "32": {"text": "فتح"},
      "33": {"text": "وثق"},
      "34": {"text": "نصب"},
      "35": {"text": "يدع"}
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grouped Letters'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(4),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (MediaQuery.of(context).size.width ~/ 180).toInt(),
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 1,
        ),
        itemCount: groupedAlphabets.entries.length,
        itemBuilder: (context, index) {
          final itemKey = groupedAlphabets.keys.elementAt(index);
          final itemValue = groupedAlphabets[itemKey]!['text']!;
          return Lesson2Card(itemValue: itemValue, itemKey: itemKey);
        },
      ),
    );
  }
}
