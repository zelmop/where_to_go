import 'package:data/data.dart';
import 'package:flutter/material.dart';

class PaymentListTile extends StatelessWidget {
  final PaymentItem item;
  final VoidCallback onTap;

  const PaymentListTile({
    super.key,
    required this.item,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        height: 60,
        width: size.width * .8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item.name),
            Text('\$ ${item.price}'),
            GestureDetector(
              onTap: onTap,
              child: const Icon(Icons.delete_outline)
            )
          ]
        )
      )
    );
  }
}