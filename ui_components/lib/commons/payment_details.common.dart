import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:ui_components/text/text.dart';

class PaymentDetails extends StatelessWidget {
  final List<Friend> friends;
  final List<PaymentItem> paymentItems;
  
  const PaymentDetails({
    super.key,
    required this.friends,
    required this.paymentItems
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          PaymentResultText(text: 'Total: \$ ${paymentItems.fold(0.0, (p, c) => p + c.price)}'),
          friends.isNotEmpty ? 
          PaymentResultText(text: 'C/U: \$ ${paymentItems.fold(0.0, (p, c) => p + c.price) / friends.length }') : 
          Container()
        ]
      )
    );
  }
}