import 'package:flutter/material.dart';

class DetailContent extends StatelessWidget {
  const DetailContent(this.content, {
    super.key,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Text(
          content,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
