import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1F1C2C),
      // appBar: AppBar(
      //   backgroundColor: Color(0xFF1F1C2C),
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios),
      //     onPressed: () {},
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.lock),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(

          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildHeader(),
              SizedBox(height: 20),
              _buildAssets(),
              SizedBox(height: 20),
              _buildChart(),
              SizedBox(height: 20),
              _buildPrediction(),
              SizedBox(height: 20),
              _buildPredictionsList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
}

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("assets/images/welcome.png"),
        const Icon(Icons.notifications, color: Colors.white,)
      ],
    );
  }

  Widget _buildAssets() {
    return Row(
      children: [
        _buildAssetCard('Bitcoin', 'BTC', '\$2,509.75', '+3.77%', Color(0xFF9146FF)),
        SizedBox(width: 8),
        _buildAssetCard('Ethereum', 'ETH', '\$2,509.75', '+9.77%', Color(0xFF4A4E69)),
      ],
    );
  }

  Widget _buildAssetCard(String name, String symbol, String price, String change, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            Text(symbol, style: TextStyle(color: Colors.white)),
            Text(price, style: TextStyle(color: Colors.white)),
            Text(change, style: TextStyle(color: change.startsWith('+') ? Colors.green : Colors.red)),
          ],
        ),
      ),
    );
  }

  Widget _buildChart() {
    return Container(
      height: 200,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF3B3A4D),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          'Chart Placeholder', // Replace with your chart widget
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildPrediction() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF3B3A4D),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPredictionButton('BUY', Colors.green),
              _buildPredictionButton('SELL', Colors.red),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Your Prediction',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: 'If BTC price is ', style: TextStyle(color: Colors.white)),
                TextSpan(text: 'above \$44,321.55 ', style: TextStyle(color: Colors.green)),
                TextSpan(text: 'in ', style: TextStyle(color: Colors.white)),
                TextSpan(text: '60 Seconds ', style: TextStyle(color: Colors.green)),
                TextSpan(text: 'you win ', style: TextStyle(color: Colors.white)),
                TextSpan(text: '\$365.00 (80%)', style: TextStyle(color: Colors.green)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPredictionButton(String label, Color color) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildPredictionsList() {
    return Column(
      children: [
        _buildPredictionCard('SELL', '\$2,500.00', 'BTC BNB', '0.0000046 BTC', Colors.red),
        _buildPredictionCard('BUY', '\$4,500.00', 'BTC BNB', '0.0000056 BTC', Colors.green),
        _buildPredictionCard('SELL', '\$2,500.00', 'BTC BNB', '0.0000046 BTC', Colors.red),
        _buildPredictionCard('BUY', '\$4,500.00', 'BTC BNB', '0.0000056 BTC', Colors.green),
      ],
    );
  }

  Widget _buildPredictionCard(String action, String price, String pair, String amount, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF3B3A4D),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            action == 'BUY' ? Icons.arrow_upward : Icons.arrow_downward,
            color: color,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: TextStyle(color: Colors.white)),
              Text(pair, style: TextStyle(color: Colors.grey)),
              Text(amount, style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Color(0xFF1F1C2C),
      selectedItemColor: Colors.deepPurpleAccent,
      unselectedItemColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.loop),
          label: 'Loop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}