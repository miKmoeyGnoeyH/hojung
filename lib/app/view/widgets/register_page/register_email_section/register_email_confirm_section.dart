import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hojung/app/controllers/register_email_validation_controller.dart';

class RegisterEmailConfirmSection extends StatelessWidget {
  RegisterEmailConfirmSection({
    super.key,
    required this.emailController,
    required this.labelPadding,
    required this.heightOfSizedBoxBetweenLabelAndField,
    required this.heightOfSizedBoxBetweenSubsection,
  });

  final TextEditingController emailController;
  final TextEditingController emailConfirmController = TextEditingController();
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
        RegisterEmailConfirmField(emailController: emailController),
        SizedBox(height: heightOfSizedBoxBetweenSubsection),
        RegisterEmailConfirmButton(
          emailController: emailController,
          emailConfirmController: emailConfirmController,
        ),
      ],
    );
  }
}

class RegisterEmailConfirmButton extends StatelessWidget {
  const RegisterEmailConfirmButton({
    super.key,
    required this.emailController,
    required this.emailConfirmController,
  });

  final TextEditingController emailController;
  final TextEditingController emailConfirmController;

  @override
  Widget build(BuildContext context) {
    return GetX<RegisterEmailController>(
      builder: (controller) => GestureDetector(
        onTap: controller.isEmailConfirmButtonEnabled
            ? () => controller.validateEmail(
                emailController.text, emailConfirmController.text)
            : () {},
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: controller.isEmailConfirmButtonEnabled
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
            border: Border.all(
              width: 1,
              color: controller.isEmailConfirmButtonEnabled
                  ? const Color(0xffc01a24)
                  : Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
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
      ),
    );
  }
}

class RegisterEmailConfirmField extends StatelessWidget {
  const RegisterEmailConfirmField({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return GetX<RegisterEmailController>(
      builder: (controller) => TextFormField(
        scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.25),
        enabled: controller.isEmailConfirmFieldEnabled,
        validator: (value) => controller.emailConfirmFieldMessage,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [
          FilteringTextInputFormatter(RegExp('[0-9]'), allow: true),
        ],
        onChanged: (randomNumber) => controller.onEmailConfirmFieldChange(randomNumber),
        maxLength: controller.maxRandomNumberLength,
        decoration: InputDecoration(
          errorStyle: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: controller.emailConfirmMSGColor),
          errorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 0.5),
              borderRadius: BorderRadius.circular(10)),
          disabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
      ),
    );
  }
}
