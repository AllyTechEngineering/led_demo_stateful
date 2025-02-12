import 'package:flutter/cupertino.dart';
import 'package:led_demo_stateful/services/timer_service.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  DateTime _startTime = DateTime.now();
  DateTime _endTime = DateTime.now().add(const Duration(hours: 1));

  void _setStartTime(DateTime newTime) {
    setState(() {
      _startTime = newTime;
      TimerService().scheduleGpioTrigger(_startTime, _endTime);
    });
  }

  void _setEndTime(DateTime newTime) {
    setState(() {
      _endTime = newTime;
      TimerService().scheduleGpioTrigger(_startTime, _endTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Starts",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 100,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            initialDateTime: _startTime,
            onDateTimeChanged: _setStartTime,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Ends",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 100,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            initialDateTime: _endTime,
            onDateTimeChanged: _setEndTime,
          ),
        ),
      ],
    );
  }
}
