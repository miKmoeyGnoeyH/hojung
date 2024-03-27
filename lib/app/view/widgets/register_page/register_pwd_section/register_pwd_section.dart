import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojung/app/controllers/register_pwd_controller.dart';
import 'package:hojung/app/view/widgets/register_page/register_pwd_section/register_pwd_confirm_subsection.dart';
import 'package:hojung/app/view/widgets/register_page/register_pwd_section/register_pwd_input_subsection.dart';

class RegisterPwdSection extends StatelessWidget {
  RegisterPwdSection({
    super.key,
    required this.pwdEditingController,
    required this.labelPadding,
    required this.heightOfSizedBoxBetweenLabelAndField,
    required this.heightOfSizedBoxBetweenSubSection,
  });

  final TextEditingController pwdEditingController;
  final TextEditingController pwdConfirmEditingController =
      TextEditingController();

  final double labelPadding;
  final double heightOfSizedBoxBetweenLabelAndField;
  final double heightOfSizedBoxBetweenSubSection;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RegisterPwdInputSubSection(
            pwdEditingController: pwdEditingController,
            labelPadding: labelPadding,
            heightOfSizedBoxBetweenLabelAndField:
                heightOfSizedBoxBetweenLabelAndField),
        SizedBox(height: heightOfSizedBoxBetweenSubSection),
        RegisterPwdConfirmSubSection(
            pwdEditingController: pwdEditingController,
            pwdConfirmEditingController: pwdConfirmEditingController,
            labelPadding: labelPadding,
            heightOfSizedBoxBetweenLabelAndField:
                heightOfSizedBoxBetweenLabelAndField),
      ],
    );
  }
}




