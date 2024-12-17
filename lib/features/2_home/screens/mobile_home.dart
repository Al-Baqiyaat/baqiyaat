import '../../dashboard/screens/dashboard_screen.dart';
import '../../deeds/screens/deeds_screen.dart';
import '../../learn/screens/learn_screen.dart';
import '../../salat/screens/salat_screen.dart';
import '../../quran/screen/quran_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/view_index_notifier.dart';

class MobileHome extends ConsumerStatefulWidget {
  const MobileHome({super.key});

  @override
  ConsumerState<MobileHome> createState() => _MobileHomeState();
}

class _MobileHomeState extends ConsumerState<MobileHome> {
  final screens = const [
    DashboardScreen(),
    DeedsScreen(),
    LearnScreen(),
    QuranScreen(),
    SalatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    int bottomNavBarIndex = ref.watch(viewIndexProvider);
    final dashboardCounterNotifier = ref.read(viewIndexProvider.notifier);
    return Scaffold(
      body: screens[bottomNavBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavBarIndex,
        onTap: (value) {
          dashboardCounterNotifier.changeDashboardCounter(value);
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'WorkSans',
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        unselectedItemColor: const Color(0xFF646464),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'WorkSans',
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(
                  Icons.home,
                  size: 25,
                ),
              )),
          BottomNavigationBarItem(
              label: 'Match',
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(
                  Icons.explore,
                  size: 25,
                ),
              )),
          BottomNavigationBarItem(
              label: '',
              icon: Icon(
                Icons.add,
                size: 40,
              )),
          BottomNavigationBarItem(
              label: 'Inbox',
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(
                  Icons.inbox,
                  size: 25,
                ),
              )),
          BottomNavigationBarItem(
              label: 'Profile',
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(
                  Icons.person,
                  size: 25,
                ),
              )),
        ],
      ),
    );
  }
}
