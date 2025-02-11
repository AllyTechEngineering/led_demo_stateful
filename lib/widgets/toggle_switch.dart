import 'package:flutter/material.dart';
import 'package:led_demo_stateful/services/pwm_service.dart';
import 'package:led_demo_stateful/utilities/constants.dart';


class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  final PwmService _pwmService = PwmService();
  bool _isOn = false;

  void _togglePower() {
    setState(() {
      _isOn = !_isOn;
      _pwmService.pwmSystemOnOff();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.kWidth,
      height: Constants.kHeight,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: _isOn ? Constants.kColorTrue : Constants.kColorFalse,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _isOn ? Constants.kOn : Constants.kOff,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          Switch(
            value: _isOn,
            onChanged: (_) => _togglePower(),
          ),
        ],
      ),
    );
  }
}
