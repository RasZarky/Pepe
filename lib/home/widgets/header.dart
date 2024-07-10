import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("assets/images/welcome.png"),
        Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Color(0xFF4A4E69),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.notifications_none_outlined, color: Colors.white,)
        )
      ],
    );
  }
}
