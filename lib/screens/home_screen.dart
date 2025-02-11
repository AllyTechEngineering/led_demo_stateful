import 'package:flutter/material.dart';
import 'package:led_demo_stateful/utilities/constants.dart';
import 'package:led_demo_stateful/widgets/flash_toggle_switch.dart';
import 'package:led_demo_stateful/widgets/input_status_indicator.dart';
import 'package:led_demo_stateful/widgets/slide_switch.dart';
import 'package:led_demo_stateful/widgets/toggle_switch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Constants.kTitle), centerTitle: true),
      body: Center(
        child: SizedBox(
          width: Constants.kSizedBoxWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Flash LED Toggle
              const FlashToggleSwitch(),

              const SizedBox(width: 20), // Space between elements

              // Vertical PWM Speed Slider
              const SizedBox(
                width: 100.0,
                height: 300.0,
                child: SlideSwitch(vertical: true),
              ),

              const SizedBox(width: 40),

              // Right Column: Power Toggle and Input Indicator
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  ToggleSwitch(),
                  SizedBox(height: 20),
                  InputStatusIndicator(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
