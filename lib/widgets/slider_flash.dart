import 'package:flutter/material.dart';
import 'package:led_demo_stateful/services/gpio_service.dart';
import 'package:led_demo_stateful/utilities/constants.dart';
// import 'package:led_demo_stateful/widgets/rectangular_slider_thumb_shape.dart';

class SliderFlash extends StatefulWidget {
  final bool vertical;

  const SliderFlash({super.key, this.vertical = false});

  @override
  State<SliderFlash> createState() => _SliderFlashState();
}

class _SliderFlashState extends State<SliderFlash> {
  // final PwmService _pwmService = PwmService();
  final GpioService _gpioService = GpioService();

  double _flashValue = 0.0;

  void _updatePwmValue(double value) {
    setState(() {
      _flashValue = value;
      _gpioService.updateDeviceFlashRate(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Constants.kSizedBoxHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green.shade900, Colors.green.shade500],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(90), // Replaces withOpacity
                  offset: const Offset(4, 4),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Text(
              '${Constants.kLabel}${_flashValue.toInt()}%',
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 10,
                // thumbShape: const RectangularSliderThumbShape(),
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 20),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
                tickMarkShape: const RoundSliderTickMarkShape(),
                activeTickMarkColor: Colors.white,
                inactiveTickMarkColor: Colors.black,
                inactiveTrackColor: Colors.grey,
                activeTrackColor: Colors.blueGrey,
                thumbColor: Colors.green.shade400,
                valueIndicatorColor: Colors.blueGrey,
                valueIndicatorTextStyle: const TextStyle(color: Colors.white),
              ),
              child: RotatedBox(
                quarterTurns: widget.vertical ? 3 : 0,
                child: Slider(
                  value: _flashValue,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: '${_flashValue.toInt()}%',
                  onChanged: _updatePwmValue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
