import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojung/app/controllers/register_email_validation_controller.dart';
import 'package:hojung/app/view/widgets/register_page/register_email_section/register_email_confirm_section.dart';
import 'package:hojung/app/view/widgets/register_page/register_email_section/register_email_send_section.dart';

class RegisterEmailSection extends StatelessWidget {
  const RegisterEmailSection(
      {super.key,
      required this.emailEditingController,
      required this.labelPadding,
      required this.heightOfSizedBoxBetweenLabelAndField,
      required this.heightOfSizedBoxBetweenSubSection});

  final TextEditingController emailEditingController;

  final double labelPadding;
  final double heightOfSizedBoxBetweenLabelAndField;
  final double heightOfSizedBoxBetweenSubSection;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RegisterSendEmailSection(
          emailEditingController: emailEditingController,
          labelPadding: labelPadding,
          heightOfSizedBoxBetweenLabelAndField:
              heightOfSizedBoxBetweenLabelAndField,
          heightOfSizedBoxBetweenSubSection: heightOfSizedBoxBetweenSubSection,
        ),
        SizedBox(height: heightOfSizedBoxBetweenSubSection),
        RegisterEmailConfirmSection(
          emailController: emailEditingController,
          labelPadding: labelPadding,
          heightOfSizedBoxBetweenLabelAndField:
              heightOfSizedBoxBetweenLabelAndField,
          heightOfSizedBoxBetweenSubsection: heightOfSizedBoxBetweenSubSection,
        ),
      ],
    );
  }
}
