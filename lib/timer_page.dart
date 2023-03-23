import 'package:firebase_test/timerController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerPage extends StatelessWidget {
  final controller = Get.put(TimerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                '${controller.secondsElapsed.value} seconds elapsed',
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.startTimer();
                  },
                  child: const Text('Start Call'),
                ),
                // -----------------------
                const SizedBox(width: 16),
                // -----------------------
                ElevatedButton(
                  onPressed: () {
                    controller.stopTimer();
                  },
                  child: const Text('End Call'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
