
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojung/app/controllers/auth_controller.dart';
import 'package:hojung/app/view/widgets/global/custom_appbar.dart';
import 'package:hojung/app/view/widgets/global/reuseable_button.dart';
import 'package:hojung/app/view/widgets/sign_in_page/id_text_field.dart';
import 'package:hojung/app/view/widgets/sign_in_page/pwd_text_field.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController idController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: buildAppbar(context, '로그인', centertitle: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IDTextField(idController: idController),
              const SizedBox(height: 3),
              PwdTextField(pwdController: pwdController),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => authController.sign(idController.text, pwdController.text),
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Center(
                      child: Text(
                        '로그인',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                ),
              ),
              ReuseableButton(
                onTap: () => authController.register(),
                text: '회원가입',
                width: 100,
                borderRadius: 20,
                color: Colors.transparent,
                textColor: Colors.white.withOpacity(0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
