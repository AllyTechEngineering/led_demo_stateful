import 'package:flutter/material.dart';

class CustomDecorations {
  static BoxDecoration gradientContainer({required bool isActive}) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: isActive
            ? [Colors.green.shade900, Colors.green.shade500]
            : [Colors.red.shade900, Colors.red.shade300],
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
