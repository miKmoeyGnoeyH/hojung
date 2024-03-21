import 'package:get/get.dart';
import 'package:hojung/app/view/main_page_view.dart';
import 'package:hojung/app/view/pages/details_page.dart';
import 'package:hojung/app/view/pages/register_page.dart';
import 'package:hojung/app/view/pages/sign_in_page.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.mainPage,
      page: () => MainPageView(),
    ),
    GetPage(
      name: Routes.signInPage,
      page: () => SignInPage(),
    ),
    GetPage(
      name: Routes.detailsPage,
      page: () => DetailsPage(),
    ),
    GetPage(
      name: Routes.registerPage,
      page: () => const RegisterPage(),
    )
  ];
}
