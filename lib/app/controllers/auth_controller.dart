
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

  // final _isLoading = false.obs;
  //
  // get isLoading => _isLoading.value;
  //
  // set isLoading(value) => _isLoading.value = value;
  //
  // // psw
  // String _psw = '!Q2w3e4r';
  //
  // get psw => _psw;
  //
  // set psw(value) => _psw = value;
  //
  // // email
  // String _email = '20191137';
  //
  // get email => _email;
  //
  // set email(value) => _email = value;
  //
  // // userModel
  // final Rx<UserModel?> _userModel = UserModel().obs;
  //
  // get userModel => _userModel.value;
  //
  // set userModel(value) => _userModel.value = value;

  // signIn() async {
  //   isLoading = true;
  //   log('isLoading = ${isLoading.toString()}');
  //   try {
  //     await authRepository.signIn(email, psw).then((data) {
  //       userModel = data;
  //       if (userModel.userId != '') {
  //         log('login successed : ${userModel.toString()}');
  //         Get.offAllNamed(Routes.mainPage);
  //       }
  //     });
  //   } catch (e) {
  //     log(e.toString());
  //   } finally {
  //     isLoading = false;
  //     log('isLoading = ${isLoading.toString()}');
  //   }
  // }
  //
  // signOut() {
  //   isLoading = true;
  //   authRepository.signOut(userModel).then((data) {
  //     userModel = data;
  //   });
  //   isLoading = false;
  // }
  //
  // getPosts() {
  //   authRepository.getPosts(userModel);
  // }
