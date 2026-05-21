import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Placeholder Login screen.
/// Replace the body with your full login implementation.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return const Scaffold(
      backgroundColor: Color(0xFFF6F8FA),
      body: Center(
        child: Text(
          'Login Screen',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0D0F14),
          ),
        ),
      ),
    );
  }
}