import 'package:tamos_family_club/common/theme/colors.dart';
import 'package:flutter/material.dart';

class PaymentSubscriptionBlock extends StatelessWidget {
  const PaymentSubscriptionBlock(
      {super.key, required this.name, required this.cost});

  final String name;
  final String cost;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cost,
                style: TextStyle(
                  fontFamily: 'Articulat',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: defaultTextColor100,
                ),
              ),
              Text(
                '/mth',
                style: TextStyle(
                  fontFamily: 'Articulat',
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: defaultTextColor60,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: TextStyle(
              fontFamily: 'Articulat',
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: defaultTextColor60,
            ),
          ),
        ],
      ),
    );
  }
}
