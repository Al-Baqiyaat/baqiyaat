import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/navigators.dart';
import '../../../views/dashboard/dashboard_screen.dart';
import '../../quran/notifiers/quran_controller.dart';

class InitNotifier extends StateNotifier<bool> {
  final QuranNotifier _quran;
  InitNotifier({required QuranNotifier quran})
      : _quran = quran,
        super(false);

  Future<void> init(BuildContext context) async {
    await _quran.loadQuran(context);
    if (context.mounted) {
      navigateAndRemoveUntil(context, DashboardScreen());
    }
  }
}
// -----------------------------------------------------------------------------

final initProvider = StateNotifierProvider<InitNotifier, bool>((ref) {
  final quran = ref.read(quranProvider.notifier);
  return InitNotifier(
    quran: quran,
  );
});
