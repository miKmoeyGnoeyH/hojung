import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hojung/app/data/models/user/guest_user_model.dart';
import 'package:http/http.dart' as http;

class LoggedInUser extends Guest {
  LoggedInUser(super.userEmail, super.userId, super.cookieString, super.signButtonText) : super.fromParam();

  @override
  goToSignInPage() {
    return sign('', '');
  }

  @override
  sign(String id, String pwd) async {
    final String signOutUrl = dotenv.env['API_SIGNOUTURL']!;

    final http.Response response = await http
        .get(Uri.parse(signOutUrl), headers: {'Cookie': cookieString});
    log('SignOutResponse :\n\theader : ${response.headers.toString()}\n\tbody : ${response.body.toString()}');

    if (response.statusCode == 200) {
      return Guest();
    } else {
      return this;
    }
    return Guest();
  }

  @override
  void register() {}

  @override
  void contactToSeller() {}
}
