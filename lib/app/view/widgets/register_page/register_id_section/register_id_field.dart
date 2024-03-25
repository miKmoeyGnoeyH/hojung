import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hojung/app/controllers/register_id_controller.dart';

class RegisterIDField extends StatelessWidget {
  const RegisterIDField({
    super.key,
    required this.formKey,
    required this.idEditingController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController idEditingController;

  @override
  Widget build(BuildContext context) {
    return GetX<RegisterIDController>(
      builder: (controller) => Form(
        key: formKey,
        child: TextFormField(
          validator: (value) => controller.idValidateMessage,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: [
            FilteringTextInputFormatter(
              RegExp('[a-z A-Z ㄱ-ㅎ|가-힣|·|：]'),
              allow: true,
            ),
          ],
          enabled: controller.isIDFieldEnabled,
          controller: idEditingController,
          onChanged: (id) => controller.onIDFieldChange(id.length),
          maxLength: controller.maxIDLength,
          decoration: InputDecoration(
            errorStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: controller.idValidateMSGColor),
            hintText:
                '${controller.minIDLength}자리 이상 ${controller.maxIDLength}자리 이하 문자',
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.5)),
            errorBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary, width: 0.5),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
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
      ),
    );
  }
}
