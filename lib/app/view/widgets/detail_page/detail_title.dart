import 'package:flutter/material.dart';

class DetailTitle extends StatelessWidget {
  const DetailTitle(
      this.title, {
        super.key,
      });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}