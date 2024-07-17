import 'package:flutter/material.dart';

class AssetsCard extends StatelessWidget {
  final String name;
  final String amount;
  final String change;
  final String quantity;
  const AssetsCard(
      {super.key,
      required this.name,
      required this.amount,
      required this.change,
      required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C44),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(name),
              Text(
                amount,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(change.contains('-')
                      ? "assets/images/bear.png"
                      : "assets/images/bull.png"),
                  Text(
                    change,
                    style: TextStyle(
                      color: change.contains('-') ? Colors.red : Colors.green,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                quantity,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
