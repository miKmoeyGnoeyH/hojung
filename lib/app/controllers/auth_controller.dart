
import 'dart:developer';

import 'package:get/get.dart';
import 'package:hojung/app/data/models/user/guest_user_model.dart';

class AuthController extends GetxController {
  final Rx<Guest> _user = Guest().obs;

  get user => _user.value;

  String displayUserId() => _user.value.userId;
  String signButtonText() => _user.value.signButtonText;

  goToSignInPage() async {
    log('Auth : goToSignInPage()');
    _user.value = await _user.value.goToSignInPage();
  }

  sign(String id, String pwd) async {
    log('sign');
    _user.value = await _user.value.sign(id, pwd);
    log(_user.value.runtimeType.toString());
  }

  register() {
    _user.value.register();
  }

  contactToSeller() {
    _user.value.contactToSeller();
  }
}
