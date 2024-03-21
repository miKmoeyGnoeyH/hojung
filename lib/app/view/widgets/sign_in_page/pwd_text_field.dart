import 'package:flutter/material.dart';

class PwdTextField extends StatelessWidget {
  const PwdTextField({
    super.key,
    required this.pwdController,
  });

  final TextEditingController pwdController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: pwdController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: '비밀번호',
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Colors.white.withOpacity(0.5),
        ),
        filled: true,
        fillColor: Theme.of(context)
            .colorScheme
            .onBackground
            .withOpacity(0.075),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 0.5),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
      ),
    );
  }
}