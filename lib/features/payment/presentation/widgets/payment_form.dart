import 'package:flutter/material.dart';

import 'custom_card_cvv_field.dart';
import 'custom_card_date_field.dart';
import 'custom_card_holder_name_field.dart';
import 'custom_card_number_field.dart';

class PaymentForm extends StatelessWidget {
  const PaymentForm({
    super.key,
    required this.cardCvvController,
    required this.cardDateController,
    required this.cardHolderController,
    required this.cardNumberController,
  });
  final TextEditingController cardNumberController;
  final TextEditingController cardHolderController;
  final TextEditingController cardDateController;
  final TextEditingController cardCvvController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomCardNumberField(
            txt: 'Card number',
            controller: cardNumberController,
          ),
          const SizedBox(height: 20),
          CustomCardholderNameField(
            txt: 'Card Name',
            controller: cardHolderController,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CustomCardDateField(
                  txt: 'MM/YY',
                  controller: cardDateController,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: CustomCardCvvField(
                  txt: 'CVV',
                  controller: cardCvvController,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
