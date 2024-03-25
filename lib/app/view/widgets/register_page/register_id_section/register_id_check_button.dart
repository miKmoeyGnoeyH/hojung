import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojung/app/controllers/register_id_controller.dart';

class RegisterIDCheckButton extends StatelessWidget {
  const RegisterIDCheckButton({
    super.key,
    required this.formKey,
    required this.idEditingController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController idEditingController;

  @override
  Widget build(BuildContext context) {
    return GetX<RegisterIDController>(
      builder: (controller) => GestureDetector(
        onTap: controller.isIDCheckButtonEnabled
            ? () => controller.validateID(idEditingController.text, formKey)
            : () {},
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: controller.isIDCheckButtonEnabled
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
            border: Border.all(
              width: 1,
              color: controller.isIDCheckButtonEnabled
                  ? const Color(0xffc01a24)
                  : Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text('아이디 중복확인'),
            ),
          ),
        ),
      ),
    );
  }
}
