import 'package:flutter/material.dart';

class EndedSection extends StatelessWidget {
  final String action;
  const EndedSection({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Row(
              children: [
                const Column(
                  children: [
                    Text(
                      'ASSET',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'BTC',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    const Text(
                      'L/S',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      action,
                      style: TextStyle(
                          color: action == "BUY" ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                const Column(
                  children: [
                    Text(
                      '\$',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '\$5',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                const Column(
                  children: [
                    Text(
                      'DURATION',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '00:20',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      'OPEN PRICE',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '62,463.4451',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'CLOSURE PRICE',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '\$62,463.44',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: Color(0xFF4A4E69),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            children: [
              Image.asset(
                "assets/images/LOSS.png",
                width: 30,
                height: 30,
              ),
              const Text(
                '+\$4.30',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
