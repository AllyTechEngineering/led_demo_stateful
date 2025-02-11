import 'package:flutter/material.dart';
import 'package:led_demo_stateful/services/pwm_service.dart';
import 'package:led_demo_stateful/utilities/constants.dart';
import 'package:led_demo_stateful/widgets/rectangular_slider_thumb_shape.dart';

class SlideSwitch extends StatefulWidget {
  final bool vertical;

  const SlideSwitch({super.key, this.vertical = false});

  @override
  State<SlideSwitch> createState() => _SlideSwitchState();
}

class _SlideSwitchState extends State<SlideSwitch> {
  final PwmService _pwmService = PwmService();
  double _pwmValue = 0.0; // Default at 50%

  void _updatePwmValue(double value) {
    setState(() {
      _pwmValue = value;
      _pwmService.updatePwmDutyCycle(value.toInt());
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
          Text(
            '${Constants.kLabel}${_pwmValue.toInt()}%',
            style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 10,
                // thumbShape: const RectangularSliderThumbShape(),
                thumbShape:  const RoundSliderThumbShape(enabledThumbRadius: 20),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
                tickMarkShape: const RoundSliderTickMarkShape(),
                activeTickMarkColor: Colors.white,
                inactiveTickMarkColor: Colors.black,
                inactiveTrackColor: Colors.grey,
                activeTrackColor: Colors.blueGrey,
                thumbColor: Colors.deepOrangeAccent,
                valueIndicatorColor: Colors.blueGrey,
                valueIndicatorTextStyle: const TextStyle(color: Colors.white),
              ),
              child: RotatedBox(
                quarterTurns: widget.vertical ? 3 : 0,
                child: Slider(
                  value: _pwmValue,
                  min: 0,
                  max: 100,
                  divisions: 10,
                  label: '${_pwmValue.toInt()}%',
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
