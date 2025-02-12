import 'package:flutter/material.dart';
import 'package:led_demo_stateful/services/timer_service.dart';
import 'package:led_demo_stateful/utilities/custom_button_decorations.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  DateTime _startTime = DateTime.now();
  DateTime _endTime = DateTime.now().add(const Duration(minutes: 1));
  final TimerService _timerService = TimerService();

  Future<void> _pickDateTime(bool isStart) async {
    DateTime current = isStart ? _startTime : _endTime;

    // Select Date
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: current,
      firstDate: DateTime(2024),
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
    debugPrint('Confirming selection');
    _timerService.scheduleGpioTrigger(_startTime, _endTime);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(
              "Timer Starts: ${_formatTime(_startTime)} Ends: ${_formatTime(_endTime)}")),
    );
  }

  String _formatTime(DateTime time) {
    return "Date: ${time.month}-${time.day}-${time.year} Time: ${time.hour.toString().padLeft(2, '0')}:"
        "${time.minute.toString().padLeft(2, '0')}:"
        "${time.second.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Select Timer',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Text(
          "Starts",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Container(
          decoration: CustomButtonDecorations.gradientContainer(),
          height: 50,
          width: 150,
          child: ElevatedButton(
            onPressed: () => _pickDateTime(true),
            child: Text(
                "${_startTime.month}-${_startTime.day}-${_startTime.year} ${_startTime.hour}:${_startTime.minute}"),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Ends",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 50.0,
          width: 150.0,
          decoration: CustomButtonDecorations.gradientContainer(),
          child: ElevatedButton(
            onPressed: () => _pickDateTime(false),
            child: Text(
                "${_endTime.month}-${_endTime.day}-${_endTime.year} ${_endTime.hour}:${_endTime.minute}"),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 50.0,
          width: 150.0,
          decoration: CustomButtonDecorations.gradientContainer(),
          child: ElevatedButton(
            onPressed: _confirmSelection,
            child: const Text("Done"),
          ),
        ),
      ],
    );
  }
}
