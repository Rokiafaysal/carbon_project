import 'package:flutter/material.dart';

class GradientProgressBar extends StatelessWidget {
  final double progress; // Progress value between 0.0 and 1.0
  final double height; // Height of the progress bar
  final BorderRadius borderRadius; // Border radius for rounded corners

  const GradientProgressBar({
    super.key,
    required this.progress,
    this.height = 20,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Container with a solid color (optional)
        Container(
          height: 20,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: borderRadius,
          ),
        ),
        // Foreground container showing the progress with gradient
        FractionallySizedBox(
          widthFactor: progress, // Width scales with progress value
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              
              image: const DecorationImage(image:AssetImage("assets/e.png",),alignment: Alignment.topRight,),
              gradient: const LinearGradient(
                colors: [
                   Color.fromARGB(255, 98, 201, 180),         // End color
                  Color.fromARGB(255, 10, 105, 86),         // End color
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: borderRadius,
            ),
          
          ),
        ),
      ],
    );
  }
}