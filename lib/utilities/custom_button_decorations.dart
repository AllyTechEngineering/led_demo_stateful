import 'package:flutter/material.dart';
import 'package:led_demo_stateful/utilities/constants.dart';

class CustomButtonDecorations {
  static BoxDecoration gradientContainer() {
    return BoxDecoration(
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
    );
  }
}
