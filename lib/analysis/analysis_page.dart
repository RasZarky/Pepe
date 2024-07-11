import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../bottomNavBar/bottom_nav_bar.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12122C),
      body: Center(
        child: JelloIn(
          child: const Text(
            "Analysis",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(selectedindex: 2,),
    );
  }
}
