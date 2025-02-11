import 'package:flutter/material.dart';
import 'package:led_demo_stateful/services/gpio_service.dart';
import 'package:led_demo_stateful/utilities/constants.dart';
import 'package:led_demo_stateful/utilities/custom_decorations.dart';

class InputStatusIndicator extends StatefulWidget {
  const InputStatusIndicator({super.key});

  @override
  State<InputStatusIndicator> createState() => _InputStatusIndicatorState();
}

class _InputStatusIndicatorState extends State<InputStatusIndicator> {
  final GpioService _gpioService = GpioService();
  bool _isInputDetected = false;

  @override
  void initState() {
    super.initState();
    _gpioService.startInputPolling((newState) {
      setState(() {
        _isInputDetected = newState;
        _gpioService.setLedState(newState);
      });
    });
  }

  @override
  void dispose() {
    _gpioService.stopInputPolling();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.kWidth,
      height: Constants.kHeight,
      alignment: Alignment.center,
      decoration:
          CustomDecorations.gradientContainer(isActive: _isInputDetected),
      child: Text(
        _isInputDetected ? Constants.kStatusTrue : Constants.kStatusFalse,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
