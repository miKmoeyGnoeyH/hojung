import 'package:flutter/material.dart';

class RegisterIDCheckButton extends StatelessWidget {
  const RegisterIDCheckButton({
    super.key,
    required this.validate,
    required this.isButtonEnabled,
  });

  final Function validate;
  final bool isButtonEnabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isButtonEnabled ? () => validate() : () {},
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: isButtonEnabled
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
          border: Border.all(
            width: 1,
            color: isButtonEnabled
                ? const Color(0xffc01a24)
                : Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text('아이디 중복확인'),
          ),
        ),
      ),
    );
  }
}
