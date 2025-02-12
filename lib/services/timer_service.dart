import 'dart:async';
import 'package:flutter/material.dart';
import 'package:led_demo_stateful/services/gpio_service.dart';

class TimerService {
  static final TimerService _instance = TimerService._internal();
  final GpioService _gpioService = GpioService();
  Timer? _timer;

  factory TimerService() => _instance;

  TimerService._internal();

  void scheduleGpioTrigger(DateTime startTime, DateTime endTime) {
    debugPrint('Scheduling GPIO trigger from $startTime to $endTime');
    final now = DateTime.now();
    debugPrint('Current time: $now');
    if (startTime.isAfter(now)) {
      final duration = startTime.difference(now);
      debugPrint('Duration: $duration');
      _timer?.cancel();
      _timer = Timer(duration, () {
        _gpioService.toggleGpioState();
        _scheduleEndTimer(endTime);
      });
    }
  }

  void _scheduleEndTimer(DateTime endTime) {
    final now = DateTime.now();
    if (endTime.isAfter(now)) {
      final duration = endTime.difference(now);
      _timer = Timer(duration, () {
        _gpioService.toggleGpioState();
      });
    }
  }

  void cancelTimer() {
    _timer?.cancel();
  }
}
