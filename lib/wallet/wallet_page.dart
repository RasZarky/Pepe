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
                Text(
                  'Wallett',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
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
                                items: <String>['USD', 'EUR', 'GBP']
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
                      SizedBox(height: 10),
                      Center(
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
                SizedBox(height: 20),
                Text(
                  'Recommended',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildRecommendedCard('BNB', '+1.37', '216.3'),
                    _buildRecommendedCard('ADL', '+2.72', '0.4976'),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'My Assets',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 10),
                _buildAssetCard(
                    'Bitcoin', '\$4,500.00', '-4.5%', '0.0000056 BTC'),
                _buildAssetCard('Tether', '\$2,200.00', '+4.5%', '2,600 USDT'),
                _buildAssetCard('Etherium', '\$2,000.00', '+2.1%', '0.0034 ETH'),
                _buildAssetCard('Chain Link', '\$800.00', '+2.1%', '0.0034 ETH'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildRecommendedCard(String name, String change, String value) {
  return Container(
    width: 150,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Color(0xFF1C1C44),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(height: 10),
        Text(
          change,
          style: TextStyle(
            color: change.contains('-') ? Colors.red : Colors.green,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(color: Colors.grey, fontSize: 12),
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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              change,
              style: TextStyle(
                color: change.contains('-') ? Colors.red : Colors.green,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 5),
            Text(
              quantity,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        Text(
          amount,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    ),
  );
}
