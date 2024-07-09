import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
              _buildHeader(),
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
                    return _buildAssetCard(
                      asset['name'],
                      asset['symbol'],
                      asset['price'],
                      asset['change'],
                      asset['color'],
                      asset['image'],
                    );
                  }
                },
              ),
            ),

              SizedBox(height: 20),
              _buildChart(),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeAmountButton('15mins'),
                  _buildTimeAmountButton('10\$'),
                ],
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildPredictionButton('BUY', Colors.green),
                  _buildPredictionButton('SELL', Colors.red),
                ],
              ),
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

  Widget _buildAssetCard(String name, String symbol, String price, String change, Color color, String image) {
    return Container(
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(image, width: 50, height: 50),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis), softWrap: true,),
                  const SizedBox(width: 10,),
                  Text(symbol, style: TextStyle(color: Colors.white)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(price, style: TextStyle(color: Colors.white, overflow: TextOverflow.ellipsis), softWrap: true,),
                  const SizedBox(width: 10,),
                  Text(change, style: TextStyle(color: change.startsWith('+') ? Colors.green : Colors.red, overflow: TextOverflow.ellipsis), softWrap: true,),
                ],
              )
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
      child: Center(
        child: Icon(Icons.add, color: Colors.white, size: 50),
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