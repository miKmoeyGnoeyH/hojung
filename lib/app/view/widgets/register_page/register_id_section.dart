import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class RegisterIDSection extends StatefulWidget {
  const RegisterIDSection({
    super.key,
    required this.setIsIDValidated,
    required this.idEditingController,
    required this.labelPadding,
    required this.heightOfSizedBoxBetweenLabelAndField,
    required this.heightOfSizedBoxBetweenSubSection,
  });

  final Function setIsIDValidated;

  final TextEditingController idEditingController;
  final double labelPadding;
  final double heightOfSizedBoxBetweenLabelAndField;
  final double heightOfSizedBoxBetweenSubSection;

  @override
  State<RegisterIDSection> createState() => _RegisterIDSectionState();
}

class _RegisterIDSectionState extends State<RegisterIDSection> {
  // TODO
  // 중복확인 버튼 눌렸는지 확인
  // 눌렸으면 http 응답 수신 전까지 버튼 비활성화

  // 응답 수신 이후 결과 출력
  bool isIDFieldEnabled = true;
  bool isIDCheckButtonEnabled = false;
  int minIDLength = 2;
  int maxIDLength = 20;

  void validateID(String id) async {
    setState(() {
      isIDFieldEnabled = false;
      isIDCheckButtonEnabled = false;
    });

    try {
      http.Response response = await http.post(
        Uri.parse('http://192.168.1.18:8080/usercheck'),
        body: jsonEncode({'username': id}),
      ).timeout(const Duration(seconds: 10));

      if(response.statusCode == 200) {
        widget.setIsIDValidated(true);
      }
      else if(response.statusCode == 400) {
        widget.setIsIDValidated(false);
      }
    } on Exception {
      // TODO
    }

    setState(() {
      isIDFieldEnabled = true;
    });
  }

  void enableIDCheckButton(int length) {
    log('onChanged, length = $length');
    widget.setIsIDValidated(false);
    if (length >= minIDLength && length <= maxIDLength) {
      setState(() {
        isIDCheckButtonEnabled = true;
      });
    } else {
      setState(() {
        isIDCheckButtonEnabled = false;
      });
    }
  }

  void disableIDCheckButton() {
    setState(() {
      isIDCheckButtonEnabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.labelPadding),
          child: const Text('ID(닉네임)'),
        ),
        SizedBox(height: widget.heightOfSizedBoxBetweenLabelAndField),
        RegisterIDField(
          isFieldEnabled: isIDFieldEnabled,
          idEditingController: widget.idEditingController,
          onChanged: enableIDCheckButton,
          minLength: minIDLength,
          maxLength: maxIDLength,
        ),
        SizedBox(height: widget.heightOfSizedBoxBetweenSubSection),
        RegisterIDCheckButton(
          idEditingController: widget.idEditingController,
          isButtonEnabled: isIDCheckButtonEnabled,
          onTap: validateID,
        ),
      ],
    );
  }
}

class RegisterIDCheckButton extends StatelessWidget {
  const RegisterIDCheckButton({
    super.key,
    required this.idEditingController,
    required this.isButtonEnabled,
    required this.onTap,
  });

  final TextEditingController idEditingController;
  final bool isButtonEnabled;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isButtonEnabled ? () => onTap(idEditingController.text) : () {},
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: isButtonEnabled
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onBackground.withOpacity(0.6),
          border: Border.all(
            width: 1,
            color: isButtonEnabled
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
    );
  }
}

class RegisterIDField extends StatelessWidget {
  const RegisterIDField({
    super.key,
    required this.idEditingController,
    required this.isFieldEnabled,
    required this.onChanged,
    required this.minLength,
    required this.maxLength,
  });

  final bool isFieldEnabled;
  final TextEditingController idEditingController;
  final Function onChanged;
  final int minLength;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: isFieldEnabled,
      controller: idEditingController,
      onChanged: (id) => onChanged(id.length),
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: '$minLength자리 이상 $maxLength자리 이하 문자',
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
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
    );
  }
}
