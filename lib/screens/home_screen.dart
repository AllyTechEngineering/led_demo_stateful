import 'package:flutter/material.dart';
import 'package:led_demo_stateful/utilities/constants.dart';
import 'package:led_demo_stateful/widgets/flash_toggle_switch.dart';
import 'package:led_demo_stateful/widgets/input_status_indicator.dart';
import 'package:led_demo_stateful/widgets/slide_switch.dart';
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
        // foregroundColor: Colors.green.shade900,
        title: Text(
          Constants.kTitle,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
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
            child: Center(child: FlashToggleSwitch()),
          ),

          // Third Column: Vertical PWM Speed Slider
          const Expanded(
            child: Center(
              child: SizedBox(
                width: 100.0,
                height: 300.0,
                child: SlideSwitch(vertical: true),
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
