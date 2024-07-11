import 'package:flutter/material.dart';
import 'package:pepe/analysis/analysis_page.dart';
import 'package:pepe/home/home_page.dart';
import 'package:pepe/profile/profile_page.dart';
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
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const WalletPage()), (route) => false);
    } else if(index == 0 && widget.selectedindex != 0){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomePage()), (route) => false);
    } else if(index == 2 && widget.selectedindex != 2){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const AnalysisPage()), (route) => false);
    } else if(index == 3 && widget.selectedindex != 3){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Profilepage()), (route) => false);
    }
  }
 //ToDo Complete this part
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        color: Color(0xFF4A4E69)
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: widget.selectedindex == 0 ? Image.asset("assets/images/selHome.png")
            : Image.asset("assets/images/home.png"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: widget.selectedindex == 1 ? Image.asset("assets/images/selWallet.png")
          : Image.asset("assets/images/wallet.png"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: widget.selectedindex == 2 ? Image.asset("assets/images/selAnalysis.png")
                : Image.asset("assets/images/analysis.png"),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: widget.selectedindex == 3 ? Image.asset("assets/images/selProfile.png")
                : Image.asset("assets/images/profile.png"),
            label: "",
          ),
        ],
        currentIndex: widget.selectedindex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0,
        backgroundColor: Colors.transparent,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}