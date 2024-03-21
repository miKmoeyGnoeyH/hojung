import 'package:flutter/material.dart';

class IDTextField extends StatelessWidget {
  const IDTextField({
    super.key,
    required this.idController,
  });

  final TextEditingController idController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: idController,
      decoration: InputDecoration(
        hintText: '호서대학교 이메일',
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white.withOpacity(0.5),
            ),
        filled: true,
        fillColor:
            Theme.of(context).colorScheme.onBackground.withOpacity(0.075),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 0.5),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
        ),
      ),
    );
  }
}
