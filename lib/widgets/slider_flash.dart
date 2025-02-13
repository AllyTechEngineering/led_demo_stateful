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

  void _updateSliderFlashRate(double value) {
    setState(() {
      _flashValue = value;
      _gpioService.updateDeviceFlashRate(value);
    });
  }

  String formatHz(double hz) {
    if (hz >= 10) {
      return hz.toStringAsFixed(0); // Show whole number Hz if ≥ 10
    } else if (hz >= 1) {
      return hz.toStringAsFixed(2); // Show 1 decimal place if 1 ≤ Hz < 10
    } else {
      return hz.toStringAsFixed(2); // Show 2 decimal places if Hz < 1
    }
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
                colors: [Constants.kColorDarkest, Constants.kColorMedium],
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
              '${Constants.kLabel} ${_flashValue.toInt() == 0 ? "∞" : formatHz(1000 / (_flashValue.toInt() * 10))} Hz',
              style: Theme.of(context).textTheme.bodySmall,
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
                thumbColor: Constants.kColorDarkest,
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
                  label: '${_flashValue.toInt() * 10}ms',
                  onChanged: _updateSliderFlashRate,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
