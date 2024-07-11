import 'package:flutter/material.dart';
import 'package:pepe/home/home_page.dart';
import 'package:pepe/wallet/wallet_page.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int selectedindex;

  const BottomNavigationBarWidget({super.key, required this.selectedindex});

  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {


  void _onItemTapped(int index) {
    if (index == 1 && widget.selectedindex != 1){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const WalletPage()));
    } else if(index == 0 && widget.selectedindex != 0){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }
 //ToDo Complete this part
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.loop),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '',
        ),
      ],
      currentIndex: widget.selectedindex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor:  const Color(0xFF4A4E69),
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: false,
    );
  }
}