import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hojung/app/controllers/register_email_validation_controller.dart';

class RegisterSendEmailSection extends StatelessWidget {
  const RegisterSendEmailSection({
    super.key,
    required this.emailEditingController,
    required this.labelPadding,
    required this.heightOfSizedBoxBetweenLabelAndField,
    required this.heightOfSizedBoxBetweenSubSection,
  });

  final TextEditingController emailEditingController;
  final double labelPadding;
  final double heightOfSizedBoxBetweenLabelAndField;
  final double heightOfSizedBoxBetweenSubSection;

  @override
  Widget build(BuildContext context) {
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
        scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.25),
        enabled: controller.isEmailFieldEnabled,
        inputFormatters: [
          FilteringTextInputFormatter(RegExp('[0-9]'), allow: true),
        ],
        controller: emailEditingController,
        textAlign: TextAlign.start,
        maxLength: controller.maxEmailLength,
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
            ? () => controller.sendValidateEmail(emailEditingController.text)
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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(controller.isValidating
                  ? '${controller.maxSeconds ~/ 60}분 이내에 인증을 완료해 주세요. 남은 시간 ${(controller.seconds / 60).toInt()} : ${(controller.seconds % 60).toString().padLeft(2, '0')}'
                  : '인증메일 발송'),
            ),
          ),
        ),
      ),
    );
  }
}
