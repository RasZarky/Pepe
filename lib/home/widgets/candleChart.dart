import 'package:crypto_market/Crypto_Market/Model/coin_model.dart';
import 'package:crypto_market/Crypto_Market/Screens/coin_candle_chart.dart';
import 'package:flutter/material.dart';

class CandleStickChart extends StatefulWidget {
  const CandleStickChart({super.key});

  @override
  State<CandleStickChart> createState() => _CandleStickChartState();
}

class _CandleStickChartState extends State<CandleStickChart> {
  @override
  Widget build(BuildContext context) {
    return CandleChart(
      coinData: coinsList.elementAt(0),
      backgroundColor: const Color(0xFF4A4E69),
      inrRate: 77.0,
      hideVolume: true,
      materialInfoDialog: false,
      intervalSelectedTextColor: Colors.red,
      intervalTextSize: 10,
      intervalUnselectedTextColor: Colors.black,
    );
  }
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
    image:
    'https://bin.bnbstatic.com/image/admin_mgs_image_upload/20201110/22ef2baf-b210-4882-afd9-1317bb7a3603.png',
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
    image:
    'https://bin.bnbstatic.com/image/admin_mgs_image_upload/20201110/4766a9cc-8545-4c2b-bfa4-cad2be91c135.png',
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