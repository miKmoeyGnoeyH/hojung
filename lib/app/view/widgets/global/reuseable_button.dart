import 'package:flutter/material.dart';

class ReuseableButton extends StatelessWidget {
  const ReuseableButton({
    super.key,
    required this.onTap,
    this.width,
    required this.text,
    required this.borderRadius,
    required this.color,
    this.textColor,
  });

  final Function() onTap;
  final double? width;
  final String text;
  final double borderRadius;
  final Color color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: textColor),
            ),
          ),
        ),
      ),
    );
  }
}
