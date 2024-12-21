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
          // Section 1: Alphabets
          Card(
            child: Column(
              children: [
                ListTile(
                    title: Text('Section 1: Alphabets',
                        style: Theme.of(context).textTheme.titleLarge)),
                Card.outlined(
                  child: ListTile(
                    onTap: () {
                      navigate(context, Lesson1Screen());
                    },
                    title: Text('Lesson 1: Forms of Letters'),
                  ),
                ),
                Card.outlined(
                  child: ListTile(
                    onTap: () {
                      navigate(context, Lesson2Screen());
                    },
                    title: Text('Lesson 2: Grouped Letters'),
                  ),
                ),
              ],
            ),
          ),

          // Section 2: Vowels
          Card(
            child: Column(
              children: [
                ListTile(
                    title: Text('Section 2: Vowels',
                        style: Theme.of(context).textTheme.titleLarge)),
                Card.outlined(
                  child: ListTile(
                    onTap: () {
                      // navigate(context, Lesson3Screen());
                    },
                    title: Text('Lesson 3: Harakat'),
                  ),
                ),
                Card.outlined(
                  child: ListTile(
                    onTap: () {
                      // navigate(context, Lesson4Screen());
                    },
                    title: Text('Lesson 4: Tanween'),
                  ),
                ),
              ],
            ),
          ),

          // Section 3: Transitions and Phonetics
          Card(
            child: Column(
              children: [
                ListTile(
                    title: Text('Section 3: Transitions and Phonetics',
                        style: Theme.of(context).textTheme.titleLarge)),
                Card.outlined(
                  child: ListTile(
                    onTap: () {
                      // navigate(context, Lesson5Screen());
                    },
                    title: Text('Lesson 5: Sukoon'),
                  ),
                ),
                Card.outlined(
                  child: ListTile(
                    onTap: () {
                      // navigate(context, Lesson6Screen());
                    },
                    title: Text('Lesson 6: Qalqalah'),
                  ),
                ),
                Card.outlined(
                  child: ListTile(
                    onTap: () {
                      // navigate(context, Lesson7Screen());
                    },
                    title: Text('Lesson 7: Shaddah'),
                  ),
                ),
              ],
            ),
          ),

          // Section 4: Special Rules and Advanced Topics
          Card(
            child: Column(
              children: [
                ListTile(
                    title: Text('Section 4: Special Rules and Advanced Topics',
                        style: Theme.of(context).textTheme.titleLarge)),
                Card.outlined(
                  child: ListTile(
                    onTap: () {
                      // navigate(context, Lesson8Screen());
                    },
                    title: Text('Lesson 8: Madd'),
                  ),
                ),
                Card.outlined(
                  child: ListTile(
                    onTap: () {
                      // navigate(context, Lesson9Screen());
                    },
                    title: Text('Lesson 9: Idgham'),
                  ),
                ),
                // Add more lessons as necessary
              ],
            ),
          ),

          // Section 5: Other Pronunciation Rules
          Card(
            child: Column(
              children: [
                ListTile(
                  title: Text('Section 5: Other Pronunciation Rules',
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                Card.outlined(
                  child: ListTile(
                    onTap: () {
                      // navigate(context, Lesson10Screen());
                    },
                    title: Text('Lesson 10: Ikhfa'),
                  ),
                ),
                Card.outlined(
                  child: ListTile(
                    onTap: () {
                      // navigate(context, Lesson11Screen());
                    },
                    title: Text('Lesson 11: Tafkhim and Tarqiq'),
                  ),
                ),
                Card.outlined(
                  child: ListTile(
                    onTap: () {
                      // navigate(context, Lesson12Screen());
                    },
                    title: Text('Lesson 12: Ghunnah'),
                  ),
                ),
                Card.outlined(
                  child: ListTile(
                    onTap: () {
                      // navigate(context, Lesson13Screen());
                    },
                    title: Text('Lesson 13: Al-Qalqalah Kubra'),
                  ),
                ),
                Card.outlined(
                  child: ListTile(
                    onTap: () {
                      // navigate(context, Lesson14Screen());
                    },
                    title: Text('Lesson 14: Raa Rules'),
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



// Ah, I see! You're looking for guidance on which Tajweed topics (like Madd, Mushaddad, Idgham, etc.) should be placed under the different sections in your LearnScreen.

// Here’s a proposed breakdown of common Tajweed topics, organized under relevant sections. This way, you can better structure your lessons:

// 1. Section 1: Alphabets
// Lesson 1: Forms of Letters (Introduction to the shapes and forms of Arabic letters, whether isolated, initial, medial, or final).
// Lesson 2: Grouped Letters (Categories like sun and moon letters, letters that share similar characteristics).
// 2. Section 2: Vowels
// Lesson 3: Harakat (Fatha, Kasra, Damma — the short vowels).
// Lesson 4: Tanween (Fathatain, Kasratain, Dammatain — the doubled vowels at the end of words).
// 3. Section 3: Transitions and Phonetics
// Lesson 5: Sukoon (The absence of a vowel, which affects how letters are joined or paused).
// Lesson 6: Qalqalah (The echoing or bouncing sound of certain letters when they have Sukoon).
// Lesson 7: Shaddah (The doubling of letters with a Sukoon, indicating the letter is pronounced twice).
// 4. Section 4: Special Rules and Advanced Topics
// Here, you can include advanced rules related to pronunciation and transitions in words. These rules are essential to Tajweed and would be grouped under this section:

// Lesson 8: Madd (The elongation of sounds, such as Madd Asli and Madd Far'i. Discusses Madd rules like Madd Munfasil and Madd Muttasil).
// Lesson 9: Idgham (The rule where a letter is assimilated into the following letter. This can include Idgham Mutamathilat, Idgham Mutaqaribat, and Idgham Bil Ghunna).
// Lesson 10: Ikhfa (The hidden pronunciation of letters when followed by certain others, leading to nasal sound articulation).
// Lesson 11: Iqlab (The rule where ب (Ba) is pronounced as a م (Meem) when followed by the letter ف (Fa)).
// 5. Section 5: Other Pronunciation Rules
// Lesson 12: Tafkhim and Tarqiq (The rules for heavy and light articulation of letters).
// Lesson 13: Ghunnah (The nasal sound that is applied to certain letters when they are followed by a Shaddah or in Idgham).
// Lesson 14: Al-Qalqalah Kubra (The larger "bounce" sound in cases where a Sukoon is present and involves stronger articulation).
// Lesson 15: Raa Rules (The rules governing the pronunciation of the letter ر (Raa), whether it’s heavy or light).