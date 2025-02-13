import 'package:flutter/material.dart';
import 'package:led_demo_stateful/utilities/constants.dart';
// import 'package:led_demo_stateful/widgets/flash_toggle_switch.dart';
import 'package:led_demo_stateful/widgets/input_status_indicator.dart';
import 'package:led_demo_stateful/widgets/slider_flash.dart';
import 'package:led_demo_stateful/widgets/slider_pwm.dart';
import 'package:led_demo_stateful/widgets/toggle_switch.dart';
import 'package:led_demo_stateful/widgets/timer_widget.dart'; // New Timer Widget

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Constants.kTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // First Column: Timer Widget
          const Expanded(
            child: TimerWidget(),
          ),

          // Second Column: Flash Toggle Switch
          const Expanded(
            child: Center(
              child: SizedBox(
                width: 100.0,
                height: 300.0,
                child: SliderFlash(vertical: true),
              ),
            ),
          ),

          // Third Column: Vertical PWM Speed Slider
          const Expanded(
            child: Center(
              child: SizedBox(
                width: 100.0,
                height: 300.0,
                child: SliderPwm(vertical: true),
              ),
            ),
          ),

          // Fourth Column: Toggle Switch and Input Status Indicator
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                ToggleSwitch(),
                SizedBox(height: 20),
                InputStatusIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
