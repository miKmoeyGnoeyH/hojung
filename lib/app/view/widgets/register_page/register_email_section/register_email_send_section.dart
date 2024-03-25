import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hojung/app/controllers/register_send_email_controller.dart';

class RegisterSendEmailSection extends StatelessWidget {
  RegisterSendEmailSection({
    super.key,
    required this.labelPadding,
    required this.heightOfSizedBoxBetweenLabelAndField,
    required this.heightOfSizedBoxBetweenSubSection,
  });

  final TextEditingController emailEditingController = TextEditingController();
  final double labelPadding;
  final double heightOfSizedBoxBetweenLabelAndField;
  final double heightOfSizedBoxBetweenSubSection;

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterEmailController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: labelPadding),
          child: const Text('호서대학교 이메일'),
        ),
        SizedBox(height: heightOfSizedBoxBetweenLabelAndField),
        RegisterEmailField(emailEditingController: emailEditingController),
        SizedBox(height: heightOfSizedBoxBetweenSubSection),
        RegisterSendEmailButton(emailEditingController: emailEditingController),
      ],
    );
  }
}

class RegisterEmailField extends StatelessWidget {
  const RegisterEmailField({
    super.key,
    required this.emailEditingController,
  });

  final TextEditingController emailEditingController;

  @override
  Widget build(BuildContext context) {
    return GetX<RegisterEmailController>(
      builder: (controller) => TextFormField(
        enabled: controller.isEmailFieldEnabled,
        inputFormatters: [
          FilteringTextInputFormatter(RegExp('[0-9]'), allow: true),
        ],
        controller: emailEditingController,
        textAlign: TextAlign.start,
        maxLength: controller.maxLength,
        validator: (value) => controller.emailFieldMessage,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (email) => controller.onEmailFieldChange(email),
        decoration: InputDecoration(
          errorStyle: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: controller.emailFieldMSGColor),
          errorMaxLines: 2,
          hintText: '학번',
          suffixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  '@vision.hoseo.edu',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.5)),
                ),
              ),
            ],
          ),
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
          errorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 0.5),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder:
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

class RegisterSendEmailButton extends StatelessWidget {
  const RegisterSendEmailButton({
    super.key,
    required this.emailEditingController,
  });

  final TextEditingController emailEditingController;

  @override
  Widget build(BuildContext context) {
    return GetX<RegisterEmailController>(
      builder: (controller) => GestureDetector(
        onTap: controller.isSendEmailButtonEnabled
            ? () => controller.validateEmail(emailEditingController.text)
            : () {},
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: controller.isSendEmailButtonEnabled
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
            border: Border.all(
              width: 1,
              color: controller.isSendEmailButtonEnabled
                  ? const Color(0xffc01a24)
                  : Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text('인증메일 발송'),
            ),
          ),
        ),
      ),
    );
  }
}
