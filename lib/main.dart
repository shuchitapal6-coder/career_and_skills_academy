
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/configure/routs/app_pages.dart';
import 'app/configure/routs/app_routs.dart';
import 'bindings/initial_binding.dart';
import 'core/storage/app_preferences.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefManager.instance.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Career & Skills Academy',

      initialBinding: InitialBinding(),

      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}