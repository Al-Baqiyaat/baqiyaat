import 'package:baqiyaat/core/utils/navigators.dart';
import 'package:flutter/material.dart';

import 'lesson1.dart';
import 'lesson2.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Section 1: Alphabets',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Card.outlined(
                  child: ListTile(
                    onTap: () {
                      navigate(context, Alphabets());
                    },
                    title: Text('Lesson 1: Alphabets'),
                  ),
                ),
                Card.outlined(
                  child: ListTile(
                    onTap: () {
                      navigate(context, AlphabetsTest());
                    },
                    title: Text('Lesson 2: Test'),
                  ),
                ),
              ],
            ),
          ),
          // ----------------------------------------------------------------------
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Section 2: Vowels',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Card.outlined(
                  child: ListTile(
                    onTap: () {
                      // navigate(context, Alphabets());
                    },
                    title: Text(
                      // 'Lesson 3: Fatha (ــَـ), Kasrah (ــِـ), Dammah (ــُـ)',
                      'Lesson 3: Fatha, Kasrah, Dammah',
                    ),
                  ),
                ),
                Card.outlined(
                  child: ListTile(
                    onTap: () {
                      // navigate(context, AlphabetsTest());
                    },
                    title: Text(
                      // 'Lesson 4: Fathatain (ــًـ), Kasratain (ــٍـ), Dammatain (ــٌـ)',
                      'Lesson 4: Fathatain, Kasratain, Dammatain',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
