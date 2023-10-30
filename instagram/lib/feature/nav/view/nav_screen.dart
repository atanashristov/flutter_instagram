import 'package:flutter/material.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  static const String routeName = '/nav';

  // Use `PageRouteBuilder` with `transitionDuration = 0`
  // so that the login appears above the splash screen
  static Route<dynamic> route() => PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        transitionDuration: Duration.zero,
        pageBuilder: (_, __, ___) => const NavScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Nav screen')),
    );
  }
}
