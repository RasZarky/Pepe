import 'package:flutter/material.dart';

class AssetCard extends StatelessWidget {
  final String name;
  final String symbol;
  final String price;
  final String change;
  final Color color;
  final String image;
  const AssetCard({super.key, required this.image, required this.name,
  required this.color, required this.change, required this.price, required this.symbol});

  @override
  Widget build(BuildContext context) {
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
}
