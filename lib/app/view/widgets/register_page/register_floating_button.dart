import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hojung/app/controllers/register_email_validation_controller.dart';
import 'package:hojung/app/controllers/register_id_controller.dart';
import 'package:hojung/app/controllers/register_pwd_controller.dart';
import 'package:http/http.dart' as http;

class RegisterButton extends StatelessWidget {
  RegisterButton({
    super.key,
    required this.idEditingController,
    required this.pwdEditingController,
    required this.emailEditingController,
  });

  Future<void> register(
      BuildContext context, String id, String pwd, String email) async {
    try {
      http.Response response = await http
          .post(
        Uri.parse('${dotenv.get('API_BASEURL')}/mail'),
        body: jsonEncode({'email': '$email@vision.hoseo.edu'}),
      )
          .timeout(const Duration(seconds: 3),
          onTimeout: () => throw Exception());

      if (response.statusCode == 200) {
        // 회원가입 완료 페이지로 이동
      } else if (response.statusCode == 400) {
        if (context.mounted) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('회원가입 실패'),
              content: const Text('아이디 혹은 비밀번호가 올바른 형식인지 확인해 주세요'),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('확인'))
              ],
            ),
          );
        }
      }
    } on Exception {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('회원가입 실패'),
            content: const Text('통신 중 오류가 발생했습니다. 다시 시도해 주세요'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('확인'))
            ],
          ),
        );
      }
    }
  }

  TextEditingController idEditingController;
  TextEditingController pwdEditingController;
  TextEditingController emailEditingController;

  @override
  Widget build(BuildContext context) {
    RegisterIDController registerIDController =
    Get.find<RegisterIDController>();

    RegisterPwdController registerPwdController =
    Get.find<RegisterPwdController>();

    RegisterEmailController registerEmailController =
    Get.find<RegisterEmailController>();

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            spreadRadius: -10,
            color: Color(0xff9d151f),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width - 32,
      child: FloatingActionButton.extended(
        onPressed: () {
          if (registerIDController.isIDValidated &&
              registerPwdController.isPwdValidated &&
              registerEmailController.isEmailValidated) {
            register(
                context,
                idEditingController.text,
                pwdEditingController.text,
                emailEditingController.text);
          } else {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('회원가입 실패'),
                  content: const Text('필요한 필드를 모두 작성했는지 확인해 주세요'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('확인'),
                    ),
                  ],
                ));
          }
        },
        label: Text('회원가입', style: Theme.of(context).textTheme.bodyLarge),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1.75,
            color: Color(0xff9d151f),
          ),
          borderRadius: BorderRadius.circular(12.5),
        ),
      ),
    );
  }
}
