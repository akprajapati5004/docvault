import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:docvault/routes/app_pages.dart';
import 'package:docvault/utils/app_colors.dart';
import 'package:docvault/utils/app_strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Edge-to-edge on Android
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const DocVaultApp());
}

class DocVaultApp extends StatelessWidget {
  const DocVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),

      initialRoute: AppPages.initial,
      getPages: AppPages.routes,

      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}