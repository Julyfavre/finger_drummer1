
import 'package:flutter/material.dart';

class DrumPad extends StatelessWidget {
  final VoidCallback onPressed;

  const DrumPad({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text('DrumPad'),
        ),
      ),
    );
  }
}
