import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pepe/wallet/widgets/assets_card.dart';
import 'package:pepe/wallet/widgets/recommended_card.dart';
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
      backgroundColor: const Color(0xFF12122C),
      bottomNavigationBar: const BottomNavigationBarWidget(
        selectedIndex: 1,
      ),
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
                const SizedBox(height: 20),
                SlideInRight(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C1C44),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'My Wallet',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color: const Color(0xFF4A4E69),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: DropdownButton<String>(
                                  value: 'USD',
                                  dropdownColor: const Color(0xFF1C1C44),
                                  icon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.white),
                                  underline: const SizedBox(),
                                  items: <String>['USD', 'EUR', 'GBP', 'GHC']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            color: Colors.white),
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
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF9A4DFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 16),
                              ),
                              child: Image.asset("assets/images/transfer.png"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF353353),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 16),
                              ),
                              child: Image.asset("assets/images/deposite.png"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF353353),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
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
                const SizedBox(height: 20),
                const Text(
                  'Recommended',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 10),
                SlideInRight(
                  from: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RecommendedCard(
                          image: 'assets/images/bnb.png',
                          change: '+1.37',
                          value: '216.3',
                          size: size),
                      RecommendedCard(
                        image: 'assets/images/adl.png',
                        change: '+2.72',
                        value: '0.4976',
                        size: size,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'My Assets',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 10),
                SlideInRight(
                  from: 300,
                  child: const AssetsCard(
                      name: 'assets/images/bitcoin.png',
                      amount: '\$4,500.00',
                      change: '-4.5%',
                      quantity: '0.0000056 BTC'),
                ),
                SlideInRight(
                    from: 350,
                    child: const AssetsCard(
                        name: 'assets/images/tether.png',
                        amount: '\$2,200.00',
                        change: '+4.5%',
                        quantity: '2,600 USDT')),
                SlideInRight(
                    from: 400,
                    child: const AssetsCard(
                        name: 'assets/images/ether.png',
                        amount: '\$2,000.00',
                        change: '+2.1%',
                        quantity: '0.0034 ETH')),
                SlideInRight(
                    from: 450,
                    child: const AssetsCard(
                        name: 'assets/images/chain.png',
                        amount: '\$800.00',
                        change: '+2.1%',
                        quantity: '0.0034 ETH')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}