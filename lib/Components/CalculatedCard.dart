import 'package:carbon/Components/appColor.dart';
import 'package:carbon/Components/defaultButton.dart';
import 'package:carbon/screen/homePage.dart';
import 'package:flutter/material.dart';

class Calculatedcard extends StatelessWidget {
  final String? predictionValue;

  const Calculatedcard({super.key, this.predictionValue});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Carbon Emission Prediction', textAlign: TextAlign.center),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
        mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/coo.png'), // Assuming the image exists in your assets
            const SizedBox(height: 16),
            const Text(
              'Your  usage of carbon is:',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              '$predictionValue Unit',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            DefaultButton(
              colored: true,
              onClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()),
                );
              },
              text: 'Back to Home',
            ),
          ],
        ),
      ),
    );
  }
}
