import 'package:flutter/material.dart';

class BuildPrediction extends StatelessWidget {
  const BuildPrediction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 16, bottom: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Prediction',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(text: 'If ', style: TextStyle(color: Color(0xFF4A4E69))),
                TextSpan(text: 'BTC  ', style: TextStyle(color: Colors.green)),
                TextSpan(text: 'price is ', style: TextStyle(color: Color(0xFF4A4E69))),
                TextSpan(text: 'above \$44,321.55 \n', style: TextStyle(color: Colors.green)),
                TextSpan(text: 'in ', style: TextStyle(color: Color(0xFF4A4E69))),
                TextSpan(text: '60 Seconds ', style: TextStyle(color: Colors.green)),
                TextSpan(text: 'you win ', style: TextStyle(color: Color(0xFF4A4E69))),
                TextSpan(text: '\$365.00 (80%)', style: TextStyle(color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
