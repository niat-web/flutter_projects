import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatelessWidget {
  final double percent;

  const AnimatedProgressBar({super.key, required this.percent});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: percent),
      duration: Duration(seconds: 2),
      curve: Curves.easeOutCubic,
      builder: (context, value, _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: LinearProgressIndicator(
          value: value,
          backgroundColor: Colors.grey[300],
          color: Colors.green,
          minHeight: 12,
        ),
      ),
    );
  }
}
