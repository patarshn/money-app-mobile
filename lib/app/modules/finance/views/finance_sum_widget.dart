import 'package:flutter/material.dart';

class FinanceSumWidget extends StatelessWidget {
  final String title;
  final int? amount;
  final Gradient? gradient;
  const FinanceSumWidget({
    required this.title, 
    required this.amount,
    this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        // color: Colors.blue,
        gradient: gradient,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 5),
          Text(
            amount.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}