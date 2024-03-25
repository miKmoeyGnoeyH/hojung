import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:hojung/app/controllers/register_id_controller.dart';
import 'package:hojung/app/view/widgets/register_page/register_id_section/register_id_check_button.dart';
import 'package:hojung/app/view/widgets/register_page/register_id_section/register_id_field.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class RegisterIDSection extends StatelessWidget {
  RegisterIDSection({
    super.key,
    required this.labelPadding,
    required this.heightOfSizedBoxBetweenLabelAndField,
    required this.heightOfSizedBoxBetweenSubSection,
  });

  final double labelPadding;
  final double heightOfSizedBoxBetweenLabelAndField;
  final double heightOfSizedBoxBetweenSubSection;

  final TextEditingController idEditingController = TextEditingController();
  final GlobalKey<FormState> _idFieldFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterIDController());

    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: labelPadding),
            child: const Text('ID(닉네임)'),
          ),
          SizedBox(height: heightOfSizedBoxBetweenLabelAndField),
          RegisterIDField(
            formKey: _idFieldFormKey,
            idEditingController: idEditingController,
          ),
          SizedBox(height: heightOfSizedBoxBetweenSubSection),
          RegisterIDCheckButton(
            formKey: _idFieldFormKey,
            idEditingController: idEditingController,
          ),
        ],
      ),
    );
  }
}
