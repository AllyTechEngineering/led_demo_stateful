import 'package:flutter/material.dart';
import 'package:led_demo_stateful/services/gpio_service.dart';
import 'package:led_demo_stateful/utilities/constants.dart';
import 'package:led_demo_stateful/utilities/custom_decorations.dart';

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
        _gpioService.startFlashingDevice();
      } else {
        _gpioService.stopFlashingDevice();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.kWidth,
      height: Constants.kHeight,
      padding: const EdgeInsets.all(4.0),
      decoration: CustomDecorations.gradientContainer(isActive: _isFlashing),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _isFlashing
                ? '${Constants.kLabel} Flashing'
                : '${Constants.kLabel} Off',
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
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
