import 'package:flutter/material.dart';

class TimeAmountWidget extends StatefulWidget {
  final int label;
  final String extension;
  final void Function() minusTap;
  final void Function() plusTap;
  const TimeAmountWidget({super.key, required this.label, required this.extension,
  required this.plusTap, required this.minusTap});

  @override
  State<TimeAmountWidget> createState() => _TimeAmountWidgetState();
}

class _TimeAmountWidgetState extends State<TimeAmountWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF4A4E69),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 0,),
              GestureDetector(
                  onTap: widget.minusTap,
                  child: const Icon(Icons.remove, color: Color(0xFF9146FF),)
              ),
              Text(
                "${widget.label}${widget.extension}",
                style: const TextStyle(color: Colors.white,),
              ),
              GestureDetector(
                  onTap: widget.plusTap,
                  child: const Icon(Icons.add, color: Color(0xFF9146FF))
              ),
              const SizedBox(width: 0,),
            ],
          ),
        ),
      ),
    );
  }
}
