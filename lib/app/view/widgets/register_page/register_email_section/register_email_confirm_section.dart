import 'package:flutter/material.dart';

class RegisterEmailConfirmSection extends StatelessWidget {
  const RegisterEmailConfirmSection({
    super.key,
    required this.labelPadding,
    required this.heightOfSizedBoxBetweenLabelAndField,
    required this.heightOfSizedBoxBetweenSubsection,
  });

  final double labelPadding;
  final double heightOfSizedBoxBetweenLabelAndField;
  final double heightOfSizedBoxBetweenSubsection;

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
        SizedBox(height: heightOfSizedBoxBetweenSubsection),
        const RegisterEmailConfirmButton(),
      ],
    );
  }
}

class RegisterEmailConfirmButton extends StatelessWidget {
  const RegisterEmailConfirmButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          border: Border.all(
            width: 1,
            color: const Color(0xffc01a24),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text('메일 확인'),
          ),
        ),
      ),
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
