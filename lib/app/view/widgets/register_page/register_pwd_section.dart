import 'package:flutter/material.dart';

class RegisterPwdSection extends StatelessWidget {
  const RegisterPwdSection({
    super.key,
    required this.labelPadding,
    required this.heightOfSizedBoxBetweenLabelAndField,
    required this.heightOfSizedBoxBetweenSubSection,
  });

  final double labelPadding;
  final double heightOfSizedBoxBetweenLabelAndField;
  final double heightOfSizedBoxBetweenSubSection;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RegisterPwdInputSubSection(
            labelPadding: labelPadding,
            heightOfSizedBoxBetweenLabelAndField:
                heightOfSizedBoxBetweenLabelAndField),
        SizedBox(height: heightOfSizedBoxBetweenSubSection),
        RegisterPwdConfirmSubSection(
            labelPadding: labelPadding,
            heightOfSizedBoxBetweenLabelAndField:
                heightOfSizedBoxBetweenLabelAndField),
      ],
    );
  }
}

class RegisterPwdConfirmSubSection extends StatelessWidget {
  const RegisterPwdConfirmSubSection({
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
          child: const Text('비밀번호 확인'),
        ),
        SizedBox(height: heightOfSizedBoxBetweenLabelAndField),
        const RegisterPwdConfirmField(),
      ],
    );
  }
}

class RegisterPwdInputSubSection extends StatelessWidget {
  const RegisterPwdInputSubSection({
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
          child: const Text('비밀번호'),
        ),
        SizedBox(height: heightOfSizedBoxBetweenLabelAndField),
        const RegisterPwdField(),
      ],
    );
  }
}

class RegisterPwdConfirmField extends StatelessWidget {
  const RegisterPwdConfirmField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: '비밀번호 재입력',
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
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

class RegisterPwdField extends StatelessWidget {
  const RegisterPwdField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: '*에서 *자리 영문 대소문자, 특수문자 1개 이상 포함',
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
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
