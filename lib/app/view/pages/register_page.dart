import 'package:flutter/material.dart';
import 'package:hojung/app/view/widgets/global/custom_appbar.dart';
import 'package:hojung/app/view/widgets/register_page/register_email_confirm_section.dart';
import 'package:hojung/app/view/widgets/register_page/register_email_send_section.dart';
import 'package:hojung/app/view/widgets/register_page/register_id_section/register_id_section.dart';
import 'package:hojung/app/view/widgets/register_page/register_pwd_section.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}




class _RegisterPageState extends State<RegisterPage> {
  TextEditingController pwdEditingController = TextEditingController();
  TextEditingController pwdConfirmEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController emailConfirmEditingController = TextEditingController();

  final double labelPadding = 3;
  final double heightOfSizedBoxBetweenLabelAndField = 5;
  final double heightOfSizedBoxBetweenSubSection = 10;
  final double heightOfSizedBoxBetweenSection = 50;

  bool _isIDValidated = false;
  void isIDValidated(value) => _isIDValidated = value;
  bool _isPwdValidated = false;
  void isPwdValidated(value) => _isPwdValidated = value;
  bool _isEmailValidated = false;
  void isEmailValidated(value) => _isEmailValidated = value;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
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
                  setIsIDValidated: isIDValidated,
                  labelPadding: labelPadding,
                  heightOfSizedBoxBetweenLabelAndField:
                      heightOfSizedBoxBetweenLabelAndField,
                  heightOfSizedBoxBetweenSubSection:
                      heightOfSizedBoxBetweenSubSection,
                ),
                SizedBox(height: heightOfSizedBoxBetweenSection),
                RegisterPwdSection(
                    labelPadding: labelPadding,
                    heightOfSizedBoxBetweenLabelAndField:
                        heightOfSizedBoxBetweenLabelAndField,
                    heightOfSizedBoxBetweenSubSection:
                        heightOfSizedBoxBetweenSubSection),
                SizedBox(height: heightOfSizedBoxBetweenSection),
                RegisterSendEmailSection(
                  emailEditingController: emailEditingController,
                  labelPadding: labelPadding,
                  heightOfSizedBoxBetweenLabelAndField:
                      heightOfSizedBoxBetweenLabelAndField,
                  heightOfSizedBoxBetweenSubSection:
                      heightOfSizedBoxBetweenSubSection,
                ),
                SizedBox(height: heightOfSizedBoxBetweenSubSection),
                RegisterEmailConfirmSection(
                    labelPadding: labelPadding,
                    heightOfSizedBoxBetweenLabelAndField:
                        heightOfSizedBoxBetweenLabelAndField),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
