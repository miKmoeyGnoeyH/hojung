import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:hojung/app/view/widgets/register_page/register_id_section/register_id_check_button.dart';
import 'package:hojung/app/view/widgets/register_page/register_id_section/register_id_field.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class RegisterIDSection extends StatefulWidget {
  const RegisterIDSection({
    super.key,
    required this.setIsIDValidated,
    required this.labelPadding,
    required this.heightOfSizedBoxBetweenLabelAndField,
    required this.heightOfSizedBoxBetweenSubSection,
  });

  final Function setIsIDValidated;
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
  final TextEditingController idEditingController = TextEditingController();
  final GlobalKey<FormState> _idFieldFormKey = GlobalKey<FormState>();
  String? idValidateMessage;
  Color? idValidateMSGColor;
  bool isIDFieldEnabled = true;
  bool isIDCheckButtonEnabled = false;
  int minIDLength = 2;
  int maxIDLength = 20;

  Future<void> validateID() async {
    setState(() {
      isIDFieldEnabled = false;
      isIDCheckButtonEnabled = false;
    });

    // TODO
    // 한글을 입력받으면 자음, 모음이 따로 입력되어 있는 것은 없는지 확인해야 함

    String? tempValidateMessage;

    try {
      http.Response response = await http.post(
        Uri.parse('http://192.168.1.18:8080/usercheck'),
        body: jsonEncode({'username': idEditingController.text}),
      ).timeout(const Duration(seconds: 3));

      if(response.statusCode == 200) {
        widget.setIsIDValidated(true);
        tempValidateMessage = '사용 가능한 ID입니다.';
        idValidateMSGColor = Colors.blueAccent;
      }
      else if(response.statusCode == 400) {
        widget.setIsIDValidated(false);
        tempValidateMessage = '사용 중인 ID입니다.';
        idValidateMSGColor = Colors.red;
      }
    } on Exception {
      widget.setIsIDValidated(false);
      tempValidateMessage = '인터넷 연결 상태를 확인해주세요.';
      idValidateMSGColor = Colors.red;
      setState(() {
        isIDCheckButtonEnabled = true;
      });
    }

    setState(() {
      idValidateMessage = tempValidateMessage;
      isIDFieldEnabled = true;
    });

    log(idValidateMessage.toString());
    // _idFieldFormKey.currentState!.validate();
  }

  void enableIDCheckButton(int length) {
    log('onChanged, length = $length');
    widget.setIsIDValidated(false);
    if (length < minIDLength || length > maxIDLength) {
      setState(() {
        isIDCheckButtonEnabled = false;
      });
    } else {
      setState(() {
        isIDCheckButtonEnabled = true;
        idValidateMessage = '';
      });
    }
  }

  @override
  void dispose() {
    idEditingController.dispose();
    super.dispose();
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
          formKey: _idFieldFormKey,
          validateMessage: idValidateMessage,
          validateColor: idValidateMSGColor,
          isFieldEnabled: isIDFieldEnabled,
          idEditingController: idEditingController,
          onChanged: enableIDCheckButton,
          minLength: minIDLength,
          maxLength: maxIDLength,
        ),
        SizedBox(height: widget.heightOfSizedBoxBetweenSubSection),
        RegisterIDCheckButton(
          formKey: _idFieldFormKey,
          validate: validateID,
          isButtonEnabled: isIDCheckButtonEnabled,
        ),
      ],
    );
  }
}