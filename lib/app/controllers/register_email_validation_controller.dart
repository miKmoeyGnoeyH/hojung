import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;



class RegisterEmailController extends GetxController {
  final Rx<bool> _isEmailValidated = false.obs;
  get isEmailValidated => _isEmailValidated.value;
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

  final Rx<String> _emailConfirmFieldMessage = ''.obs;
  get emailConfirmFieldMessage => _emailConfirmFieldMessage.value;
  set emailConfirmFieldMessage(value) =>
      _emailConfirmFieldMessage.value = value;

  final Rx<Color> _emailConfirmMSGColor = Colors.red.obs;
  get emailConfirmMSGColor => _emailConfirmMSGColor.value;
  set emailConfirmMSGColor(value) => _emailConfirmMSGColor.value = value;

  final Rx<bool> _isEmailConfirmFieldEnabled = true.obs;
  get isEmailConfirmFieldEnabled => _isEmailConfirmFieldEnabled.value;
  set isEmailConfirmFieldEnabled(value) =>
      _isEmailConfirmFieldEnabled.value = value;

  final Rx<bool> _isEmailConfirmButtonEnabled = false.obs;
  get isEmailConfirmButtonEnabled => _isEmailConfirmButtonEnabled.value;
  set isEmailConfirmButtonEnabled(value) =>
      _isEmailConfirmButtonEnabled.value = value;

  late Timer _timer;
  final int maxSeconds = 180;

  final Rx<int> _seconds = 180.obs;
  get seconds => _seconds.value;
  set seconds(value) => _seconds.value = value;

  final Rx<bool> _isValidating = false.obs;
  get isValidating => _isValidating.value;
  set isValidating(value) => _isValidating.value = value;

  int maxEmailLength = 8;
  int maxRandomNumberLength = 10;




  void resetTimer() {
    seconds = maxSeconds;
    isValidating = false;
    isEmailFieldEnabled = true;
    isSendEmailButtonEnabled = true;
  }



  void startTimer() {
    resetTimer();
    isValidating = true;
    isEmailFieldEnabled = false;
    isSendEmailButtonEnabled = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(seconds <= 0) {
        isValidating = false;
        _timer.cancel();
        resetTimer();
      } else {
        seconds--;
      }
    });
  }



  void onEmailFieldChange(String email) {
    // 메일이 조건을 만족하면 메일 발송 버튼 활성화
    isEmailValidated = false;
    emailFieldMessage = '';
    if (email.length >= maxEmailLength) {
      if(!isValidating) isSendEmailButtonEnabled = true;
    } else {
      isSendEmailButtonEnabled = false;
    }
  }




  Future<void> sendValidateEmail(String email) async {
    isEmailFieldEnabled = false;
    isSendEmailButtonEnabled = false;

    try {
      http.Response response = await http
          .post(
            Uri.parse('${dotenv.get('API_BASEURL')}/mail'),
            body: jsonEncode({'email': '$email@vision.hoseo.edu'}),
          )
          .timeout(const Duration(seconds: 3), onTimeout: () => throw Exception());

      if (response.statusCode == 200) {
        log('validateEmail statusCode 200');
        emailFieldMessage = '인증 메일을 보냈습니다. 인증번호를 확인해주세요.';
        emailFieldMSGColor = Colors.blue;
        startTimer();
      }
    } on Exception {
      log('validateEmail on Exception');
      isEmailValidated = false;
      emailFieldMessage = '인증 메일 발송 요청에 실패했습니다. 인터넷 연결 상태를 확인해주세요.';
      emailFieldMSGColor = Colors.red;
      isSendEmailButtonEnabled = true;
    }

    // isEmailFieldEnabled = true;
  }


  void onEmailConfirmFieldChange(String randomNumber) {
    // 메일이 조건을 만족하면 메일 발송 버튼 활성화
    isEmailValidated = false;
    emailConfirmFieldMessage = '';
    if (randomNumber.length >= maxRandomNumberLength) {
      isEmailConfirmButtonEnabled = true;
    } else {
      isEmailConfirmButtonEnabled = false;
    }
  }


  Future<void> validateEmail(String email, String randomNumber) async {
    isEmailConfirmFieldEnabled = false;
    isEmailConfirmButtonEnabled = false;

    try {
      http.Response response = await http
          .post(
        Uri.parse('${dotenv.get('API_BASEURL')}/mailcheck'),
        body: jsonEncode(
            {'email': '$email@vision.hoseo.edu', 'randomNumber': randomNumber}),
      )
          .timeout(
          const Duration(seconds: 3), onTimeout: () => throw Exception());

      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        log('validateEmail statusCode 200');
        isEmailValidated = true;
        emailConfirmFieldMessage = '메일 인증이 완료되었습니다.';
        emailConfirmMSGColor = Colors.blue;
      } else if(response.statusCode == 400) {
        isEmailValidated = false;
        emailConfirmFieldMessage = '인증 번호가 일치하지 않습니다.';
        emailConfirmMSGColor = Colors.red;
      }
    } on Exception {
      log('validateEmail on Exception');
      isEmailValidated = false;
      emailConfirmFieldMessage = '통신 중 오류가 발생했습니다. 인터넷 연결 상태를 확인해주세요.';
      emailConfirmMSGColor = Colors.red;
      isEmailConfirmButtonEnabled = true;
    }

    isEmailConfirmFieldEnabled = true;
  }
}
