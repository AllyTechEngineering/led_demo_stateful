import 'package:flutter/material.dart';
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
  final TimerService _timerService = TimerService();

  Future<void> _pickDateTime(bool isStart) async {
    DateTime current = isStart ? _startTime : _endTime;

    // Select Date
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: current,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) return;

    // Select Time
    TimeOfDay? pickedTime = await showTimePicker(
      // ignore: use_build_context_synchronously
      context: context,
      initialTime: TimeOfDay.fromDateTime(current),
    );

    if (pickedTime == null) return;

    DateTime newDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    setState(() {
      if (isStart) {
        _startTime = newDateTime;
      } else {
        _endTime = newDateTime;
      }
    });
  }

  void _confirmSelection() {
    _timerService.scheduleGpioTrigger(_startTime, _endTime);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Timer set from $_startTime to $_endTime")),
    );
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
        ElevatedButton(
          onPressed: () => _pickDateTime(true),
          child: Text("${_startTime.year}-${_startTime.month}-${_startTime.day} ${_startTime.hour}:${_startTime.minute}"),
        ),
        const SizedBox(height: 20),
        const Text(
          "Ends",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ElevatedButton(
          onPressed: () => _pickDateTime(false),
          child: Text("${_endTime.year}-${_endTime.month}-${_endTime.day} ${_endTime.hour}:${_endTime.minute}"),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _confirmSelection,
          child: const Text("Done"),
        ),
      ],
    );
  }
}
