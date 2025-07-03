import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatefulWidget {
  final double progressvalue;
  const AnimatedProgressBar({super.key, required this.progressvalue});

  @override
  State<AnimatedProgressBar> createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: widget.progressvalue),
      duration: Duration(seconds: 6),
      curve: Curves.easeOutCubic,
      builder: (BuildContext context, value, _) => LinearProgressIndicator(
        value: value,
        backgroundColor: Colors.grey[300],
        color: Colors.green,
        minHeight: 12,
      ),
    );
  }
}
