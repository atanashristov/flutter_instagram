import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  // Use `PageRouteBuilder` with `transitionDuration = 0`
  // so that the login appears above the splash screen
  static Route<dynamic> route() => PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        transitionDuration: Duration.zero,
        pageBuilder: (_, __, ___) => const LoginScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Login screen')),
    );
  }
}
