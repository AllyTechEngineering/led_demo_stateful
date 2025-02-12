import 'package:flutter/material.dart';
import 'package:led_demo_stateful/services/pwm_service.dart';
import 'package:led_demo_stateful/utilities/constants.dart';
import 'package:led_demo_stateful/utilities/custom_decorations.dart';

class ToggleSwitch extends StatefulWidget {
  const ToggleSwitch({super.key});

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  final PwmService _pwmService = PwmService();
  bool _isOn = true;

  void _togglePower() {
    setState(() {
      _isOn = !_isOn;
      _pwmService.pwmSystemOnOff();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: Constants.kWidth,
        height: Constants.kHeight,
        padding: const EdgeInsets.all(4.0),
        decoration: CustomDecorations.gradientContainer(isActive: _isOn),
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
      ),
    );
  }
}
