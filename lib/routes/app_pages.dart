import 'package:get/get.dart';

import 'package:docvault/screen/auth/auth_binding.dart';
import 'package:docvault/screen/auth/login_screen.dart';
import 'package:docvault/screen/auth/register_screen.dart';
import 'package:docvault/screen/onboarding/onboarding_binding.dart';
import 'package:docvault/screen/onboarding/onboarding_screen.dart';
import 'package:docvault/screen/splash/splash_binding.dart';
import 'package:docvault/screen/splash/splash_screen.dart';

import '../screen/dashboard/dashboard_shell.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = <GetPage>[
    GetPage(
      name: _Paths.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.onboarding,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: _Paths.register,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 400),
    ),
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardShell(),
      binding: DashboardBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}