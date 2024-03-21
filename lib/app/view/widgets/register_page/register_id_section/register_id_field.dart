import 'package:flutter/material.dart';

class RegisterIDField extends StatelessWidget {
  RegisterIDField({
    super.key,
    required this.formKey,
    required this.validateMessage,
    required this.idEditingController,
    required this.isFieldEnabled,
    required this.onChanged,
    required this.minLength,
    required this.maxLength,
  });

  final GlobalKey<FormState> formKey;
  String? validateMessage;
  final bool isFieldEnabled;
  final TextEditingController idEditingController;
  final Function onChanged;
  final int minLength;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => validateMessage.toString(),
        enabled: isFieldEnabled,
        controller: idEditingController,
        onChanged: (id) => onChanged(id.length),
        maxLength: maxLength,
        decoration: InputDecoration(
          hintText: '$minLength자리 이상 $maxLength자리 이하 문자',
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 0.5),
              borderRadius: BorderRadius.circular(10)),
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
    );
  }
}
