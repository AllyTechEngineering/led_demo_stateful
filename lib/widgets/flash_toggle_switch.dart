import 'package:flutter/material.dart';
import 'package:led_demo_stateful/services/gpio_service.dart';
import 'package:led_demo_stateful/utilities/constants.dart';



class FlashToggleSwitch extends StatefulWidget {
  const FlashToggleSwitch({super.key});

  @override
  State<FlashToggleSwitch> createState() => _FlashToggleSwitchState();
}

class _FlashToggleSwitchState extends State<FlashToggleSwitch> {
  final GpioService _gpioService = GpioService();
  bool _isFlashing = false;

  void _toggleFlashing() {
    setState(() {
      _isFlashing = !_isFlashing;
      if (_isFlashing) {
        _gpioService.startFlashingLed();
      } else {
        _gpioService.stopFlashingLed();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.kWidth,
      height: Constants.kHeight,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: _isFlashing ? Constants.kColorTrue : Constants.kColorFalse,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _isFlashing ? '${Constants.kLabel} Flashing' : '${Constants.kLabel} Off',
            style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Switch(
            value: _isFlashing,
            onChanged: (_) => _toggleFlashing(),
          ),
        ],
      ),
    );
  }
}
