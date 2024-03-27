import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojung/app/controllers/register_email_validation_controller.dart';
import 'package:hojung/app/controllers/register_id_controller.dart';
import 'package:hojung/app/controllers/register_pwd_controller.dart';
import 'package:hojung/app/view/widgets/global/custom_appbar.dart';
import 'package:hojung/app/view/widgets/register_page/register_email_section/register_email_section.dart';
import 'package:hojung/app/view/widgets/register_page/register_floating_button.dart';
import 'package:hojung/app/view/widgets/register_page/register_id_section/register_id_section.dart';
import 'package:hojung/app/view/widgets/register_page/register_pwd_section/register_pwd_section.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController idEditingController = TextEditingController();

  TextEditingController pwdEditingController = TextEditingController();

  TextEditingController emailEditingController = TextEditingController();

  final double labelPadding = 3;

  final double heightOfSizedBoxBetweenLabelAndField = 5;

  final double heightOfSizedBoxBetweenSubSection = 10;

  final double heightOfSizedBoxBetweenSection = 50;

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterIDController());
    Get.put(RegisterPwdController());
    Get.put(RegisterEmailController());

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: buildAppbar(
          context,
          '회원가입',
          centertitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegisterIDSection(
                  idEditingController: idEditingController,
                  labelPadding: labelPadding,
                  heightOfSizedBoxBetweenLabelAndField:
                      heightOfSizedBoxBetweenLabelAndField,
                  heightOfSizedBoxBetweenSubSection:
                      heightOfSizedBoxBetweenSubSection,
                ),
                SizedBox(height: heightOfSizedBoxBetweenSection),
                RegisterPwdSection(
                    pwdEditingController: pwdEditingController,
                    labelPadding: labelPadding,
                    heightOfSizedBoxBetweenLabelAndField:
                        heightOfSizedBoxBetweenLabelAndField,
                    heightOfSizedBoxBetweenSubSection:
                        heightOfSizedBoxBetweenSubSection),
                SizedBox(height: heightOfSizedBoxBetweenSection),
                RegisterEmailSection(
                  emailEditingController: emailEditingController,
                  labelPadding: labelPadding,
                  heightOfSizedBoxBetweenLabelAndField:
                      heightOfSizedBoxBetweenLabelAndField,
                  heightOfSizedBoxBetweenSubSection:
                      heightOfSizedBoxBetweenSubSection,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              ],
            ),
          ),
        ),
        floatingActionButton: RegisterButton(
          idEditingController: idEditingController,
          pwdEditingController: pwdEditingController,
          emailEditingController: emailEditingController,
        ),
      ),
    );
  }
}