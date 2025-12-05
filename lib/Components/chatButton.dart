import 'package:carbon/Components/appColor.dart';
import 'package:flutter/material.dart';

class ChatButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const ChatButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 243, 243, 243),
          foregroundColor: const Color.fromARGB(255, 83, 71, 71),
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(fontSize: 14, color: AppColors.primaryDark),
        ),
      ),
    );
  }
}
