import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojung/app/routes/app_pages.dart';
import 'package:hojung/app/view/widgets/global/custom_appbar.dart';

class RegisterComplete extends StatelessWidget {
  const RegisterComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(
        context,
        '회원가입 완료',
        centertitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '축하합니다',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text('회원가입이 완료되었습니다'),
          ],
        ),
      ),
      floatingActionButton: Container(
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
            Get.offNamedUntil(Routes.signInPage, (route) => false);
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
      ),
    );
  }
}
