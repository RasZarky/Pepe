import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pepe/home/widgets/asset_card.dart';
import 'package:pepe/home/widgets/candleChart.dart';
import 'package:pepe/home/widgets/ended_section.dart';
import 'package:pepe/home/widgets/header.dart';
import 'package:pepe/home/widgets/order_card.dart';
import 'package:pepe/home/widgets/prediction.dart';
import 'package:pepe/home/widgets/running_section.dart';
import 'package:pepe/home/widgets/time_amount_button.dart';
import '../bottomNavBar/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool running = false;
  bool ended = false;

  final List<Map<String, dynamic>> assets = [
    {
      'name': 'Bitcoin',
      'symbol': 'BTC',
      'price': '2,509.75',
      'change': '+2.5%',
      'color': const Color(0xFF9146FF),
      'image': "assets/images/btc.png",
    },
    {
      'name': 'Ethereum',
      'symbol': 'ETH',
      'price': '2,000',
      'change': '-1.2%',
      'color': const Color(0xFF4A4E69),
      'image': "assets/images/ETH.png",
    },
    // Add more assets here
  ];

  late Timer _timer;
  int _start = 20;
  String action = "BUY";
  int time = 15;
  int amount = 10;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) async {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            running = false;
            ended = true;
          });
          await Future.delayed(const Duration(seconds: 3));
          setState(() {
            ended = false;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12122C),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),
              const SizedBox(height: 20),
              const Text(
                "Assets",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SlideInRight(
                child: SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: assets.length + 1,
                    itemBuilder: (context, index) {
                      if (index == assets.length) {
                        return _buildAddCard();
                      } else {
                        final asset = assets[index];
                        return AssetCard(
                          name: asset['name'],
                          symbol: asset['symbol'],
                          price: asset['price'],
                          change: asset['change'],
                          color: asset['color'],
                          image: asset['image'],
                        );
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SlideInLeft(
                from: 150,
                child: Container(
                    height: 400,
                    padding: const EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A4E69),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: const CandleStickChart()),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TimeAmountWidget(
                      label: time,
                      extension: "mins",
                      minusTap: () {
                        if (time > 5 && !running && !ended) {
                          setState(() {
                            time = time - 5;
                          });
                        }
                      },
                      plusTap: () {
                        if (time < 30 && !running && !ended) {
                          setState(() {
                            time = time + 5;
                          });
                        }
                      }),
                  TimeAmountWidget(
                      label: amount,
                      extension: "\$",
                      minusTap: () {
                        if (amount > 5 && !running && !ended) {
                          setState(() {
                            amount = amount - 5;
                          });
                        }
                      },
                      plusTap: () {
                        if (amount < 100 && !running && !ended) {
                          setState(() {
                            amount = amount + 5;
                          });
                        }
                      }),
                ],
              ),
              const SizedBox(height: 20),
              running
                  ? FadeIn(
                      child: Column(
                        children: [
                          RunningSection(
                            action: action,
                            amount: amount,
                            start: _start,
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    )
                  : ended
                      ? FadeIn(
                          child: Column(
                            children: [
                              EndedSection(
                                action: action,
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        )
                      : FadeIn(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildPredictionButton('BUY', Colors.green),
                                  _buildPredictionButton('SELL', Colors.red),
                                ],
                              ),
                              const SizedBox(height: 15),
                              const BuildPrediction(),
                            ],
                          ),
                        ),
              const Text(
                "Predictions",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 330,
                child: ListView(
                  children: [
                    FadeInUp(
                      child: OrderCard(
                        type: 'SELL',
                        amount: '\$2,500.00',
                        btcAmount: '0.0000046 BTC',
                        color: Colors.red,
                      ),
                    ),
                    FadeInUp(
                      child: OrderCard(
                        type: 'BUY',
                        amount: '\$4,500.00',
                        btcAmount: '0.0000056 BTC',
                        color: Colors.green,
                      ),
                    ),
                    FadeInUp(
                      child: OrderCard(
                        type: 'SELL',
                        amount: '\$2,500.00',
                        btcAmount: '0.0000046 BTC',
                        color: Colors.red,
                      ),
                    ),
                    FadeInUp(
                      child: OrderCard(
                        type: 'BUY',
                        amount: '\$4,500.00',
                        btcAmount: '0.0000056 BTC',
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
        selectedIndex: 0,
      ),
    );
  }

  Widget _buildAddCard() {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF4A4E69),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Icon(Icons.add, color: Color(0xFF9146FF), size: 50),
      ),
    );
  }

  Widget _buildPredictionButton(String label, Color color) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            action = label;
            _start = 20;
            running = true;
          });
          startTimer();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
