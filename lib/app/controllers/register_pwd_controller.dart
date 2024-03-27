import 'package:get/get.dart';

class RegisterPwdController extends GetxController {
  final Rx<bool> _isPwdValidated = false.obs;
  get isPwdValidated => _isPwdValidated.value;
  set isPwdValidated(value) => _isPwdValidated.value = value;
}