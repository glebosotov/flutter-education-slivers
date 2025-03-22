import 'dart:math';

import 'package:flutter/material.dart';

class FlutterLogoTilesWidget extends StatelessWidget {
  const FlutterLogoTilesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap action here
      },
      child: Card(
        color: _getRandomColor(),
        child: const Center(
          child: FlutterLogo(size: 50),
        ),
      ),
    );
  }

  Color _getRandomColor() {
    return Color(
      (Random().nextDouble() * 0xFFFFFF).toInt(),
    ).withValues(alpha: 0.3);
  }
}
