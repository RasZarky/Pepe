import 'package:crypto_market/Crypto_Market/Model/coin_model.dart';
import 'package:crypto_market/Crypto_Market/Screens/coin_candle_chart.dart';
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
              height: 70, // Set the height for the horizontal list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: assets.length + 1, // Add one more item for the add card
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

              running ? _runningSection() :
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
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFF191B2A),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'ASSET',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(width: 20),
              Text(
                'L/S',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(width: 20),
              Text(
                '\$',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(width: 20),
              Text(
                'PAYOUT',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            children: [
              Text(
                'BTC',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 20),
              Text(
                'BUY',
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 20),
              Text(
                '\$5',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 20),
              Text(
                '+\$4.30',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 12.0),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'OPEN PRICE',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '62,463.4451',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'RESULT',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 4.0),
                  Icon(
                    Icons.emoji_emotions,
                    color: Colors.purple,
                  ),
                ],
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Color(0xFF3A4AC7),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  'TIME LEFT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(width: 8.0),
              Text(
                '00:20',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
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
            running = true;
          });
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