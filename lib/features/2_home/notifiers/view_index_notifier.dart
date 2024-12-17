import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewIndexNotifier extends StateNotifier<int> {
  ViewIndexNotifier() : super(0);

  void changeDashboardCounter(int index) {
    state = index;
  }
}
// -----------------------------------------------------------------------------

final viewIndexProvider = StateNotifierProvider<ViewIndexNotifier, int>((ref) {
  return ViewIndexNotifier();
});
