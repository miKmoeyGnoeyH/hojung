import 'package:flutter/material.dart';

class DetailSaleStatus extends StatelessWidget {
  const DetailSaleStatus({
    super.key,
    required this.saleStatus,
    required this.price,
  });

  final String saleStatus;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          saleStatus,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(width: 7),
        Text(price, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}