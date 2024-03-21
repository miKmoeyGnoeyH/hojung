import 'package:hojung/app/bindings/main_page_binding.dart';
import 'package:hojung/app/odds/custom_dark_theme.dart';
import 'package:hojung/app/odds/custom_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojung/app/routes/app_pages.dart';
import 'package:hojung/app/view/main_page_view.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await dotenv.load(fileName: 'assets/config/.env');
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: Routes.mainPage,
      initialBinding: MainPageBinding(),
      themeMode: ThemeMode.system,
      theme: CustomLightTheme.theme,
      darkTheme: CustomDarkTheme.theme,

      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KR'),
      ],
      locale: const Locale('ko'),
      home: MainPageView(),
    );
  }
}
