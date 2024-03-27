import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojung/app/controllers/register_pwd_controller.dart';

class RegisterPwdConfirmSubSection extends StatelessWidget {
  const RegisterPwdConfirmSubSection({
    super.key,
    required this.pwdEditingController,
    required this.pwdConfirmEditingController,
    required this.labelPadding,
    required this.heightOfSizedBoxBetweenLabelAndField,
  });

  final TextEditingController pwdEditingController;
  final TextEditingController pwdConfirmEditingController;

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
        RegisterPwdConfirmField(
          pwdEditingController: pwdEditingController,
          pwdConfirmEditingController: pwdConfirmEditingController,
        ),
      ],
    );
  }
}



class RegisterPwdConfirmField extends StatelessWidget {
  const RegisterPwdConfirmField({
    super.key,
    required this.pwdEditingController,
    required this.pwdConfirmEditingController,
  });

  final TextEditingController pwdEditingController;
  final TextEditingController pwdConfirmEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.25),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if(value == pwdEditingController.text) {
          Get.find<RegisterPwdController>().isPwdValidated = true;
          return null;
        } else {
          Get.find<RegisterPwdController>().isPwdValidated = false;
          return '비밀번호가 일치하지 않습니다';
        }
      },
      obscureText: true,
      decoration: InputDecoration(
        errorStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.red),
        hintText: '비밀번호 재입력',
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