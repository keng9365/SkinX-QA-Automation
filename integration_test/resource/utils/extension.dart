import 'dart:async';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExtension on WidgetTester {

  Future<void> pumpUntilFound(WidgetTester tester, Finder finder,
      {Duration timeout = const Duration(seconds: 60), isLoop = false}) async {
    bool timerDone = false;
    Timer? timer;
    if (!isLoop) {
      timer = Timer(timeout, () => timerDone = true);
    }
    while (timerDone != true) {
      await tester.pump();
      final found = tester.any(finder);
      if (found) {
        timerDone = true;
      }
    }
    timer?.cancel();
  }

}