import 'package:flutter/material.dart';

class HomePageListImg extends StatelessWidget {
  const HomePageListImg({
    super.key,
    required this.imgUrl,
  });

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104.46,
      height: 104.46,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.network(
        "http://192.168.1.18:8080/api/images$imgUrl",
        // errorBuilder: (context, object, stackTrack) =>
        //     const Icon(Icons.error_outline_rounded),
      ),
    );
  }
}