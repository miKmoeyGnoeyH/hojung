import 'package:flutter/material.dart';

class DetailContactToSellerButton extends StatelessWidget {
  const DetailContactToSellerButton(
    this.onPressed, {
    super.key,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            spreadRadius: -10,
            color: Color(0xff9d151f),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width - 32,
      child: FloatingActionButton.extended(
          onPressed: onPressed,
          label:
              Text('판매자에게 연락하기', style: Theme.of(context).textTheme.bodyLarge),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1.75,
              color: Color(0xff9d151f),
            ),
            borderRadius: BorderRadius.circular(12.5),
          )),
    );
  }
}
