import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bottomNavBar/bottom_nav_bar.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF12122C),
      bottomNavigationBar: BottomNavigationBarWidget(selectedindex: 1,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Wallet',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                SlideInRight(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFF1C1C44),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'My Wallet',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFF4A4E69),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: DropdownButton<String>(
                                  value: 'USD',
                                  dropdownColor: Color(0xFF1C1C44),
                                  icon: Icon(Icons.arrow_drop_down, color: Colors
                                      .white),
                                  underline: SizedBox(),
                                  items: <String>['USD', 'EUR', 'GBP', 'GHC']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {},
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Center(
                          child: Text(
                            '\$8,540.00',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF9A4DFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 16),
                              ),
                              child: Image.asset("assets/images/transfer.png"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF353353),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 16),
                              ),
                              child: Image.asset("assets/images/deposite.png"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF353353),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 16),
                              ),
                              child: Image.asset("assets/images/swap.png"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Recommended',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 10),
                SlideInRight(
                  from: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildRecommendedCard('assets/images/bnb.png', '+1.37', '216.3', size),
                      _buildRecommendedCard('assets/images/adl.png', '+2.72', '0.4976', size),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'My Assets',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 10),
                SlideInRight(
                  from: 300,
                  child: _buildAssetCard(
                      'assets/images/bitcoin.png', '\$4,500.00', '-4.5%', '0.0000056 BTC'),
                ),
                SlideInRight(
                  from: 350,
                    child: _buildAssetCard('assets/images/tether.png', '\$2,200.00', '+4.5%', '2,600 USDT')),
                SlideInRight(
                  from: 400,
                    child: _buildAssetCard('assets/images/ether.png', '\$2,000.00', '+2.1%', '0.0034 ETH')),
                SlideInRight(
                  from: 450,
                    child: _buildAssetCard('assets/images/chain.png', '\$800.00', '+2.1%', '0.0034 ETH')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildRecommendedCard(String image, String change, String value, double size) {
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
        SizedBox(height: 30),
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
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildAssetCard(
    String name, String amount, String change, String quantity) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8),
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Color(0xFF1C1C44),
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
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(change.contains('-') ? "assets/images/bear.png" : "assets/images/bull.png"),
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
