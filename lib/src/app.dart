import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_gym_control_free/src/app_binding.dart';
import 'package:simple_gym_control_free/src/localization/app_localizations.dart';
import 'package:simple_gym_control_free/src/ui/routes/route_names.dart';
import 'package:simple_gym_control_free/src/ui/routes/route_pages.dart';
import 'package:simple_gym_control_free/src/ui/theme/app_theme_data.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: AppThemeData.dark,
      debugShowCheckedModeBanner: false,
      fallbackLocale: const Locale('en', 'US'),
      getPages: RoutePages.all,
      initialBinding: const AppBinding(),
      initialRoute: RouteNames.home,
      locale: Get.deviceLocale,
      theme: AppThemeData.light,
      translations: const AppLocalizations(),
    );
  }
}
