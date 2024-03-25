import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterEmailController extends GetxController {
  final Rx<bool> _isEmailValidated = false.obs;

  set isEmailValidated(value) => _isEmailValidated.value = value;

  final Rx<bool> _isEmailFieldEnabled = true.obs;

  get isEmailFieldEnabled => _isEmailFieldEnabled.value;

  set isEmailFieldEnabled(value) => _isEmailFieldEnabled.value = value;

  final Rx<bool> _isSendEmailButtonEnabled = false.obs;

  get isSendEmailButtonEnabled => _isSendEmailButtonEnabled.value;

  set isSendEmailButtonEnabled(value) =>
      _isSendEmailButtonEnabled.value = value;

  final Rx<String> _emailFieldMessage = ''.obs;

  get emailFieldMessage => _emailFieldMessage.value;

  set emailFieldMessage(value) => _emailFieldMessage.value = value;

  final Rx<Color> _emailFieldMSGColor = Colors.red.obs;

  get emailFieldMSGColor => _emailFieldMSGColor.value;

  set emailFieldMSGColor(value) => _emailFieldMSGColor.value = value;

  // 인증중인 메일 저장할 변수
  // 타이머가 실행중이면 인증 중인 메일에 대해 메일 발송 버튼 비활성화
  late Timer _timer;
  final int maxSeconds = 60;
  late int seconds;
  bool isValidating = false;

  int maxLength = 8;

  void resetTimer() {
    seconds = maxSeconds;
    isValidating = false;
  }

  void startTimer() {
    resetTimer();
    isValidating = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(seconds <= 0) {
        _timer.cancel();

      }
    });
  }

  void onEmailFieldChange(String email) {
    // 메일이 조건을 만족하면 메일 발송 버튼 활성화
    emailFieldMessage = '';
    if (email.length >= maxLength) {
      if(!isValidating) isSendEmailButtonEnabled = true;
    } else {
      isSendEmailButtonEnabled = false;
    }
  }

  Future<void> validateEmail(String email) async {
    isEmailFieldEnabled = false;
    isSendEmailButtonEnabled = false;

    try {
      http.Response response = await http
          .post(
            Uri.parse('${dotenv.get('API_BASEURL')}/mail'),
            body: jsonEncode({'email': '$email@vision.hoseo.edu'}),
          )
          .timeout(const Duration(seconds: 3));

      if (response.statusCode == 200) {
        isEmailValidated = true;
        emailFieldMessage = '인증 메일을 보냈습니다. 인증번호를 확인해주세요.';
        emailFieldMSGColor = Colors.blue;
      }
    } on Exception {
      isEmailValidated = false;
      emailFieldMessage = '인증 메일 발송 요청에 실패했습니다. 인터넷 연결 상태를 확인해주세요.';
      emailFieldMSGColor = Colors.red;
      isSendEmailButtonEnabled = true;
    }

    isEmailFieldEnabled = true;
  }
}
