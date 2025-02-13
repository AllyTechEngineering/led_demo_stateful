import 'package:flutter/material.dart';
import 'package:led_demo_stateful/services/timer_service.dart';
import 'package:led_demo_stateful/utilities/constants.dart';
import 'package:led_demo_stateful/utilities/custom_button_decorations.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  TimerWidgetState createState() => TimerWidgetState();
}

class TimerWidgetState extends State<TimerWidget> {
  DateTime _startTime = DateTime.now();
  DateTime _endTime = DateTime.now().add(const Duration(minutes: 1));
  final TimerService _timerService = TimerService();

  Future<void> _pickDateTime(bool isStart) async {
    if (!mounted) return; // Ensure widget is still in the tree

    DateTime current = isStart ? _startTime : _endTime;

    // Select Date
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: current,
      firstDate: DateTime(2024),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (!mounted || pickedDate == null) return;

    // Select Time
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(current),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (!mounted || pickedTime == null) return;

    DateTime newDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    if (mounted) {
      setState(() {
        if (isStart) {
          _startTime = newDateTime;
        } else {
          _endTime = newDateTime;
        }
      });
    }
  }

  void _confirmSelection() {
    if (!mounted) return;
    debugPrint('Confirming selection');
    _timerService.scheduleGpioTrigger(_startTime, _endTime);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Timer Starts: ${_formatTime(_startTime)} Ends: ${_formatTime(_endTime)}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      );
    }
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
        Text('Select Timer', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 10.0),
        Text("Starts", style: Theme.of(context).textTheme.titleSmall),
        Container(
          decoration: CustomButtonDecorations.gradientContainer(),
          height: Constants.kLargeBoxHeight,
          width: Constants.kLargeBoxWidth,
          child: ElevatedButton(
            onPressed: () => _pickDateTime(true),
            child: Text(
              "${_startTime.month}-${_startTime.day}-${_startTime.year} ${_startTime.hour}:${_startTime.minute}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text("Ends", style: Theme.of(context).textTheme.titleSmall),
        Container(
          height: Constants.kLargeBoxHeight,
          width: Constants.kLargeBoxWidth,
          decoration: CustomButtonDecorations.gradientContainer(),
          child: ElevatedButton(
            onPressed: () => _pickDateTime(false),
            child: Text(
              "${_endTime.month}-${_endTime.day}-${_endTime.year} ${_endTime.hour}:${_endTime.minute}",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: Constants.kLargeBoxHeight,
          width: Constants.kLargeBoxWidth,
          decoration: CustomButtonDecorations.gradientContainer(),
          child: ElevatedButton(
            onPressed: _confirmSelection,
            child: Text(
              "Done",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
        ),
      ],
    );
  }
}
