import 'package:flutter/material.dart';

class CustomButtonDecorations {
  static BoxDecoration gradientContainer() {
    return BoxDecoration(
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
    );
  }
}
