import 'dart:async';
import 'dart:developer';
import 'package:firebase_test/constants.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {
  var secondsElapsed = 0.obs;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      secondsElapsed.value += 1;
    });
    // callManager.checkDailyQuota();
    log(callManager.startDate.toString());
    log(callManager.durationDays.toString());
  }

  void stopTimer() {
    timer?.cancel();
    secondsElapsed.value = 0;
    callManager.endCall();
  }
}
