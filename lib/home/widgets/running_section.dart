import 'package:flutter/material.dart';

class RunningSection extends StatefulWidget {
  final String action;
  final int amount;
  final int start;
  const RunningSection(
      {super.key,
      required this.action,
      required this.amount,
      required this.start});

  @override
  State<RunningSection> createState() => _RunningSectionState();
}

class _RunningSectionState extends State<RunningSection> {
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
                      widget.action,
                      style: TextStyle(
                          color: widget.action == "BUY"
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    const Text(
                      '\$',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '\$${widget.amount}',
                      style: const TextStyle(
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
                      'PAYOUT',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '+\$4.30',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Column(
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
                const SizedBox(
                  width: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'RESULT',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Image.asset("assets/images/LOSS.png")
                  ],
                )
              ],
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(.4),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'TIME LEFT',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '00:${widget.start}',
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
