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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Constants.kWidth,
        height: Constants.kHeight,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(4.0),
        decoration:
            CustomDecorations.gradientContainer(isActive: _isInputDetected),
        child: Text(
          _isInputDetected ? Constants.kStatusTrue : Constants.kStatusFalse,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
