import 'package:flutter/material.dart';

class RegisterEmailConfirmSection extends StatelessWidget {
  const RegisterEmailConfirmSection({
    super.key,
    required this.labelPadding,
    required this.heightOfSizedBoxBetweenLabelAndField,
  });

  final double labelPadding;
  final double heightOfSizedBoxBetweenLabelAndField;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: labelPadding),
          child: const Text('이메일 확인 인증번호'),
        ),
        SizedBox(height: heightOfSizedBoxBetweenLabelAndField),
        const RegisterEmailConfirmField(),
      ],
    );
  }
}

class RegisterEmailConfirmField extends StatelessWidget {
  const RegisterEmailConfirmField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder:
        OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 0.5),
            borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor:
        Theme.of(context).colorScheme.onBackground.withOpacity(0.075),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}