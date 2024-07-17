import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../bottomNavBar/bottom_nav_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12122C),
      body: Center(
        child: BounceInUp(
          from: 150,
          curve: Curves.easeInOutBack,
          child: const Text(
            "Profile",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
        selectedIndex: 3,
      ),
    );
  }
}
