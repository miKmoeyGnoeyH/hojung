import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterPwdInputSubSection extends StatelessWidget {
  const RegisterPwdInputSubSection({
    super.key,
    required this.pwdEditingController,
    required this.labelPadding,
    required this.heightOfSizedBoxBetweenLabelAndField,
  });

  final TextEditingController pwdEditingController;
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
        RegisterPwdField(
          pwdEditingController: pwdEditingController,
        ),
      ],
    );
  }
}

class RegisterPwdField extends StatelessWidget {
  const RegisterPwdField({
    super.key,
    required this.pwdEditingController,
  });

  final TextEditingController pwdEditingController;
  final String regExp =
      '^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9\s]).*[a-zA-Z0-9!@#\$%^&*]+\$';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: pwdEditingController,
      obscureText: true,
      validator: (value) {
        log(value.toString());
        if (value == null) {
          return '';
        }
        if (value.length >= 8) {
          if (RegExp(regExp).hasMatch(value)) {
            log(RegExp(regExp).hasMatch(value).toString());
            return null;
          }
          if (!RegExp(regExp).hasMatch(value)) {
            log(RegExp(regExp).hasMatch(value).toString());
            return '영문 대문자, 소문자, 숫자, 특수문자를 1개 이상 포함해 주세요.';
          }
        } else {
          return '영문 대문자, 소문자, 숫자, 특수문자를 1개 이상 포함하여 8자리 이상 입력해 주세요';
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [
        FilteringTextInputFormatter(
          RegExp(
            // 영문 대소문자, 숫자, 특수문자 0개 이상으로 시작하고, 영문 대소문자, 숫자, 특수문자로 이루어져 있고 끝나는 8자리 이상 문자열
            // '^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@\$!%*?&])[A-Za-z\d@\$!%*?&]{8,}\$;'
              '[a-zA-Z0-9!@#\$%^&*]'),
          allow: true,
        ),
      ],
      decoration: InputDecoration(
        errorStyle:
        Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.red),
        errorMaxLines: 2,
        hintText: '*에서 *자리 영문 대소문자, 특수문자 1개 이상 포함',
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
        errorBorder:
        OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 0.5),
            borderRadius: BorderRadius.circular(10)),
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