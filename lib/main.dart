import 'dart:io';
import 'package:flutter/material.dart';
import 'package:led_demo_stateful/screens/home_screen.dart';
import 'package:led_demo_stateful/services/gpio_service.dart';
import 'package:led_demo_stateful/services/pwm_service.dart';
import 'package:window_manager/window_manager.dart';


void main() async {
  final PwmService pwmService = PwmService();
  final GpioService gpioService = GpioService();

  WidgetsFlutterBinding.ensureInitialized();

  // Ensure GPIO and PWM services are initialized only once
  pwmService.initializePwmService();
  gpioService.initializeGpioService();

  // Initialize window_manager
  await windowManager.ensureInitialized();
  windowManager.addListener(MyWindowListener(pwmService, gpioService));

  runApp(MyApp(pwmService: pwmService, gpioService: gpioService));
}

class MyWindowListener extends WindowListener {
  final PwmService pwmService;
  final GpioService gpioService;

  MyWindowListener(this.pwmService, this.gpioService);

  @override
  void onWindowClose() async {
    debugPrint("Window close detected, disposing resources...");
    pwmService.dispose();
    gpioService.dispose();
    exit(0); // Ensure the app fully exits
  }
}

class MyApp extends StatefulWidget {
  final PwmService pwmService;
  final GpioService gpioService;

  const MyApp({super.key, required this.pwmService, required this.gpioService});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    debugPrint('Disposing MyApp resources...');
    widget.pwmService.dispose();
    widget.gpioService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LED Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(),
    );
  }
}
