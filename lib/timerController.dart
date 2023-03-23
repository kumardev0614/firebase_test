import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';

class TimerController extends GetxController {
  var secondsElapsed = 0.obs;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      secondsElapsed.value += 1;
    });
  }

  void stopTimer() {
    timer?.cancel();
    secondsElapsed.value = 0;
  }
}
