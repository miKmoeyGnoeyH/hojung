import 'package:flutter/material.dart';

class RegisterIDCheckButton extends StatelessWidget {
  const RegisterIDCheckButton({
    super.key,
    required this.formKey,
    required this.validate,
    required this.isButtonEnabled,
  });

  final GlobalKey<FormState> formKey;
  final Function validate;
  final bool isButtonEnabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
      //     () {
      //   if(formKey.currentState!.validate()) formKey.currentState!.save();
      // },
      isButtonEnabled ? () => validate() : () {},
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: isButtonEnabled
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
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
