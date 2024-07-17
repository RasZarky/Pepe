import 'package:flutter/material.dart';

class RecommendedCard extends StatelessWidget {
  final double size;
  final String image;
  final String change;
  final String value;
  const RecommendedCard(
      {super.key,
      required this.size,
      required this.image,
      required this.change,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 0.44,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C44),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                change,
                style: TextStyle(
                  color: change.contains('-') ? Colors.red : Colors.green,
                  fontSize: 14,
                ),
              ),
              Text(
                value,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
