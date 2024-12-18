import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/icons.dart';
import '../../dashboard/screens/dashboard_screen.dart';
import '../../deeds/screens/deeds_screen.dart';
import '../../learn/screens/learn_screen.dart';
import '../../quran/screen/quran_screen.dart';
import '../../salah/screens/salah_screen.dart';
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
    SalahScreen(),
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
                  CustomIcons.home,
                ),
              )),
          BottomNavigationBarItem(
              label: 'Deeds',
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(
                  CustomIcons.deeds,
                ),
              )),
          BottomNavigationBarItem(
              label: 'Learn',
              icon: Icon(
                CustomIcons.learn,
              )),
          BottomNavigationBarItem(
              label: 'Quran',
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(
                  CustomIcons.quran,
                ),
              )),
          BottomNavigationBarItem(
              label: 'Salah',
              icon: Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Icon(
                  CustomIcons.prayer,
                ),
              )),
        ],
      ),
    );
  }
}
