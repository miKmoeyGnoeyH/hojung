import 'package:flutter/material.dart';

class HomePageListPrice extends StatelessWidget {
  const HomePageListPrice({
    super.key,
    required this.price,
  });

  final String price;

  @override
  Widget build(BuildContext context) {
    return Text(price, style: Theme.of(context).textTheme.titleLarge);
  }
}
