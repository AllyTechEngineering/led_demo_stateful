import 'dart:io';
import 'package:flutter/material.dart';
import 'package:led_demo_stateful/screens/home_screen.dart';
import 'package:led_demo_stateful/services/gpio_service.dart';
import 'package:led_demo_stateful/services/pwm_service.dart';
import 'package:led_demo_stateful/utilities/custom_app_theme.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services once
  final pwmService = PwmService();
  final gpioService = GpioService();
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
    exit(0);
  }
}

class MyApp extends StatelessWidget {
  final PwmService pwmService;
  final GpioService gpioService;

  const MyApp({super.key, required this.pwmService, required this.gpioService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LED Demo',
      theme: CustomAppTheme.appTheme, // Use static theme
      home: const HomeScreen(),
    );
  }
}
