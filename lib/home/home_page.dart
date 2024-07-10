import 'dart:async';

import 'package:crypto_market/Crypto_Market/Model/coin_model.dart';
import 'package:crypto_market/Crypto_Market/Screens/coin_candle_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pepe/home/widgets/asset_card.dart';
import 'package:pepe/home/widgets/header.dart';
import 'package:pepe/home/widgets/order_card.dart';
import 'package:pepe/home/widgets/prediction.dart';

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
      'color': Color(0xFF9146FF),
      'image': "assets/images/btc.png",
    },
    {
      'name': 'Ethereum',
      'symbol': 'ETH',
      'price': '2,000',
      'change': '-1.2%',
      'color': Color(0xFF4A4E69),
      'image': "assets/images/ETH.png",
    },
    // Add more assets here
  ];

  late Timer _timer;
  int _start = 20;
  String action = "BUY";

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
        backgroundColor: const Color(0xFF1F1C2C),
      body: SafeArea(
        child: SingleChildScrollView(

          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Header(),

              const SizedBox(height: 20),

              const Text("Assets",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 10),

            Container(
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
                      name:  asset['name'],
                      symbol:  asset['symbol'],
                      price:  asset['price'],
                      change:  asset['change'],
                      color:  asset['color'],
                      image: asset['image'],
                    );
                  }
                },
              ),
            ),

              SizedBox(height: 20),

              Container(
                height: 400,
                padding: EdgeInsets.only(top: 6),
                decoration: BoxDecoration(
                    color: Color(0xFF4A4E69),
                    borderRadius: BorderRadius.circular(15.0),),
                  child: candleChart()),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeAmountButton('15mins'),
                  _buildTimeAmountButton('10\$'),
                ],
              ),

              SizedBox(height: 20),

              running ? Column(
                children: [
                  _runningSection(),
                  const SizedBox(height: 20,)
                ],
              ) : ended ? Column(
                children: [
                  _endedSection(),
                  const SizedBox(height: 20,)
                ],
              )  :
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPredictionButton('BUY', Colors.green),
                      _buildPredictionButton('SELL', Colors.red),
                    ],
                  ),

                  SizedBox(height: 15),

                  BuildPrediction(),
                ],
              ),

              const Text("Predictions",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),

              Container(
                height: 330,
                child: ListView(
                  children: [
                    OrderCard(
                      type: 'SELL',
                      amount: '\$2,500.00',
                      btcAmount: '0.0000046 BTC',
                      color: Colors.red,
                    ),
                    OrderCard(
                      type: 'BUY',
                      amount: '\$4,500.00',
                      btcAmount: '0.0000056 BTC',
                      color: Colors.green,
                    ),
                    OrderCard(
                      type: 'SELL',
                      amount: '\$2,500.00',
                      btcAmount: '0.0000046 BTC',
                      color: Colors.red,
                    ),
                    OrderCard(
                      type: 'BUY',
                      amount: '\$4,500.00',
                      btcAmount: '0.0000056 BTC',
                      color: Colors.green,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );

}

  Widget _runningSection(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [

            Row(
              children: [
                const Column(
                  children: [
                    Text(
                      'ASSET',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'BTC',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox( width: 20,),

                Column(
                  children: [
                    const Text(
                      'L/S',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      action,
                      style: TextStyle(color: action == "BUY" ? Colors.green : Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox( width: 20,),

                const Column(
                  children: [
                    Text(
                      '\$',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '\$5',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox( width: 20,),

                const Column(
                  children: [
                    Text(
                      'PAYOUT',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '+\$4.30',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),

            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Column(
                  children: [
                    Text(
                      'OPEN PRICE',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '62,463.4451',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox( width: 60,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'RESULT',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Image.asset("assets/images/LOSS.png")
                  ],
                )
              ],
            )

          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(.4),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'TIME LEFT',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '00:$_start',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _endedSection(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [

            Row(
              children: [
                const Column(
                  children: [
                    Text(
                      'ASSET',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      'BTC',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox( width: 20,),

                Column(
                  children: [
                    const Text(
                      'L/S',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      action,
                      style: TextStyle(color: action == "BUY" ? Colors.green : Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox( width: 20,),

                const Column(
                  children: [
                    Text(
                      '\$',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '\$5',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox( width: 20,),

                const Column(
                  children: [
                    Text(
                      'DURATION',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '00:20',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 20,),

            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      'OPEN PRICE',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '62,463.4451',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox( width: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'CLOSURE PRICE',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '\$62,463.44',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            )

          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: Color(0xFF4A4E69),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            children: [
              Image.asset("assets/images/LOSS.png", width: 30, height: 30,),
              const Text(
                '+\$4.30',
                style: TextStyle(color: Colors.white, fontSize: 20,),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAddCard() {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF4A4E69),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Icon(Icons.add, color: Color(0xFF9146FF), size: 50),
      ),
    );
  }

  Widget candleChart() {
    return CandleChart(
      coinData: coinsList.elementAt(0),
      backgroundColor: Color(0xFF4A4E69),
      inrRate: 77.0,
      hideVolume: true,
      materialInfoDialog: false,
      intervalSelectedTextColor: Colors.red,
      intervalTextSize: 10,
      intervalUnselectedTextColor: Colors.black,
    );
  }

  List<Coin> coinsList = [
    Coin(
      id: '1',
      image: 'https://s2.coinmarketcap.com/static/img/coins/64x64/1.png',
      name: 'Bitcoin',
      shortName: 'BTC',
      price: '123456',
      lastPrice: '123456',
      percentage: '-0.5',
      symbol: 'BTCUSDT',
      pairWith: 'USDT',
      highDay: '567',
      lowDay: '12',
      decimalCurrency: 4,
    ),
    Coin(
      id: '2',
      image: 'https://s2.coinmarketcap.com/static/img/coins/64x64/1.png',
      name: 'Bitcoin',
      shortName: 'BTC',
      price: '123456',
      lastPrice: '123456',
      percentage: '-0.5',
      symbol: 'BTCINR',
      pairWith: 'INR',
      highDay: '567',
      lowDay: '12',
      decimalCurrency: 4,
    ),
    Coin(
      id: '3',
      image: 'https://s2.coinmarketcap.com/static/img/coins/64x64/1839.png',
      name: 'Binance',
      shortName: 'BNB',
      price: '0.0005',
      lastPrice: '0.0005',
      percentage: '-0.5',
      symbol: 'BNBBUSD',
      pairWith: 'BUSD',
      highDay: '567',
      lowDay: '12',
      decimalCurrency: 4,
    ),
    Coin(
      id: '4',
      image: 'https://bin.bnbstatic.com/image/admin_mgs_image_upload/20201110/22ef2baf-b210-4882-afd9-1317bb7a3603.png',
      name: 'Dogecoin',
      shortName: 'DOGE',
      price: '123456',
      lastPrice: '123456',
      percentage: '-0.5',
      symbol: 'DOGEUSDT',
      pairWith: 'USDT',
      highDay: '567',
      lowDay: '12',
      decimalCurrency: 4,
    ),
    Coin(
      id: '5',
      image: 'https://bin.bnbstatic.com/image/admin_mgs_image_upload/20201110/4766a9cc-8545-4c2b-bfa4-cad2be91c135.png',
      name: 'XRP',
      shortName: 'XRP',
      price: '123456',
      lastPrice: '123456',
      percentage: '-0.5',
      symbol: 'XRPUSDT',
      pairWith: 'USDT',
      highDay: '567',
      lowDay: '12',
      decimalCurrency: 4,
    ),
  ];


  Widget _buildTimeAmountButton(String label) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Color(0xFF4A4E69),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 0,),
              Icon(Icons.remove, color: Color(0xFF9146FF),),
              Text(
                label,
                style: TextStyle(color: Colors.white,),
              ),
              Icon(Icons.add, color: Color(0xFF9146FF)),
              SizedBox(width: 0,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPredictionButton(String label, Color color) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          setState(() {
            action = label;
            _start = 20;
            running = true;
          });
          startTimer();
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          padding: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

}