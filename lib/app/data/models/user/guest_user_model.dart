import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hojung/app/data/models/user/logged_in_user_model.dart';
import 'package:hojung/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;

class Guest {
  late String userEmail;
  late String userId;
  late String cookieString;
  late String signButtonText;

  Guest.fromParam(this.userEmail, this.userId, this.cookieString, this.signButtonText);
  Guest() : userEmail = '', userId = '로그인 후 이용해 주세요', cookieString = '', signButtonText = '로그인';

  goToSignInPage() {
    return Get.toNamed(Routes.signInPage);
  }

  Future<Guest> sign(String id, String pwd) async {
    final String signInUrl = dotenv.env['API_BASEURL']!;
    Guest ret = Guest();

    final response = await http
        .post(
          Uri.parse(signInUrl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(
            {'username': '$id@vision.hoseo.edu', 'password': pwd},
          ),
        )
        .timeout(const Duration(seconds: 10));
    log(response.body.toString());

    if (response.statusCode == 200) {
      final String rawCookie = response.headers['set-cookie']!;
      final List<String> cookieList = rawCookie.split(',');
      String cookieString = '';

      for (var cookiePart in cookieList) {
        cookieString = '$cookieString${cookiePart.split('Path=/')[0]}';
      }

      log('userEmail : $id@vision.hoseo.edu, userId : $id, cookie: $cookieString');

      ret = LoggedInUser('$id@vision.hoseo.edu', id, cookieString, '로그아웃');
      Get.back();
    }
    // ret = LoggedInUser('$id@vision.hoseo.edu', id, '', '로그아웃');
    // Get.back();
    return ret;
  }

  void register() {
    Get.toNamed(Routes.registerPage);
  }

  void contactToSeller() {
    goToSignInPage();
  }
}
