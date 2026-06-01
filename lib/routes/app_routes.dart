part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splash     = _Paths.splash;
  static const onboarding = _Paths.onboarding;
  static const login      = _Paths.login;
  static const register   = _Paths.register;
  static const dashboard  = _Paths.dashboard;
}

abstract class _Paths {
  _Paths._();

  static const splash     = '/splash';
  static const onboarding = '/onboarding';
  static const login      = '/login';
  static const register   = '/register';
  static const dashboard  = '/dashboard';
}