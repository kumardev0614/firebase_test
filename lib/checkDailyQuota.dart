import 'dart:async';
import 'dart:developer';

import 'constants.dart';

class CallManager {
  static const int dailyCallQuotaInSeconds = 120;

  DateTime _lastCallTime = DateTime.now();
  var _totalCallDurationToday = getData("totalCallDurationToday");

  DateTime startDate = DateTime.now();
  var durationDays = getData("durationDays");

  void startCall() {
    _lastCallTime = DateTime.now();
    log("_lastCallTime: ${_lastCallTime.toString()}");
    log("_totalCallDurationToday: ${_totalCallDurationToday.toString()}");
    log("startDate ${startDate.toString()}");
    log("durationDays ${durationDays.toString()}");
  }

  void endCall() async {
    int callDuration = DateTime.now().difference(_lastCallTime).inSeconds;
    _totalCallDurationToday += callDuration;
    await database
        .collection("myusers")
        .doc("L2EaJXjW1SBOuvUm8hPx")
        .update({'totalCallDurationToday': _totalCallDurationToday});
    log("_totalCallDurationToday: ${_totalCallDurationToday.toString()}");
  }

  bool checkDailyQuota() {
    DateTime now = DateTime.now();
    if (_totalCallDurationToday >= dailyCallQuotaInSeconds) {
      log("Daily call quota exceeded");
      return false;
    }
    if (now.difference(startDate).inDays >= durationDays) {
      log("Subscription expired");
      return false;
    }
    startCall();
    return true;
  }

  void resetDailyCallDuration() {
    DateTime now = DateTime.now();
    if (now.difference(_lastCallTime).inDays > 0) {
      _totalCallDurationToday = 0;
    }
  }
}
