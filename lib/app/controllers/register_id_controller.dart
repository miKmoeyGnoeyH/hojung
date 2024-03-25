import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterIDController extends GetxController {
  // 회원가입 페이지에서 필요한 필드가 모두 검증됐는지 확인하기 위한 변수
  // 아이디가 중복되지 않음이 검증됐는지
  final Rx<bool> _isIDValidated = false.obs;
  set isIDValidated(value) => _isIDValidated.value = value;

  // 서버 통신 중 아이디 입력 필드를 비활성화하기 위한 변수
  // 인증요청 시 통신 도중 입력된 아이디를 변경하는 경우를 막기 위함
  final Rx<bool> _isIDFieldEnabled = true.obs;
  get isIDFieldEnabled => _isIDFieldEnabled.value;
  set isIDFieldEnabled(value) => _isIDValidated.value = value;

  // 서버 통신 중 아이디 중복확인 요청 버튼을 비활성화하기 위한 변수
  final Rx<bool> _isIDCheckButtonEnabled = false.obs;
  get isIDCheckButtonEnabled => _isIDCheckButtonEnabled.value;
  set isIDCheckButtonEnabled(value) => _isIDCheckButtonEnabled.value = value;


  // 통신 결과를 표시하기 위한 문자열
  final Rx<String> _idValidateMessage = ''.obs;
  get idValidateMessage => _idValidateMessage.value;
  set idValidateMessage(value) => _idValidateMessage.value = value;

  // 통신 결과에 따라 문자열 색깔을 다르게 표시하기 위한 변수
  final Rx<Color> _idValidateMSGColor = Colors.red.obs;
  get idValidateMSGColor => _idValidateMSGColor.value;
  set idValidateMSGColor(value) => _idValidateMSGColor.value = value;

  int minIDLength = 2;
  int maxIDLength = 20;

  void onIDFieldChange(int length) {
    log('onChanged, length = $length');
    isIDValidated = false;
    if (length < minIDLength || length > maxIDLength) {
      isIDCheckButtonEnabled = false;
      idValidateMessage = '$minIDLength자리 이상 $maxIDLength자리 이하로 입력해 주세요';
      idValidateMSGColor = Colors.red;
    } else {
      isIDCheckButtonEnabled = true;
      idValidateMessage = '';
    }
  }

  Future<void> validateID(String id, GlobalKey<FormState> formKey) async {
    isIDFieldEnabled = false;
    isIDCheckButtonEnabled = false;

    // TODO
    // 한글을 입력받으면 자음, 모음이 따로 입력되어 있는 것은 없는지 확인해야 함

    try {
      http.Response response = await http
          .post(
            Uri.parse('${dotenv.env['API_BASEURL']}/usercheck'),
            body: jsonEncode({'username': id}),
          )
          .timeout(const Duration(seconds: 3));

      if (response.statusCode == 200) {
        isIDValidated = true;
        idValidateMessage = '사용 가능한 ID입니다.';
        idValidateMSGColor = Colors.blue;
      } else if (response.statusCode == 400) {
        isIDValidated = false;
        idValidateMessage = '사용 중인 ID입니다.';
        idValidateMSGColor = Colors.red;
      }
    } on Exception {
      isIDValidated = false;
      idValidateMessage = '인터넷 연결 상태를 확인해주세요.';
      idValidateMSGColor = Colors.red;
      // 통신 중 오류가 발생해 검증에 실패하면
      // 해당 아이디로 다시 요청할 수 있어야 함
      isIDCheckButtonEnabled = true;
    }

    isIDFieldEnabled = true;
    formKey.currentState?.validate();
  }
}
