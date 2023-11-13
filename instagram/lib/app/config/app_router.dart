import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:instagram/feature/login/view/login_screen.dart';
import 'package:instagram/feature/nav/view/nav_screen.dart';
import 'package:instagram/feature/profile/view/profile_edit_screen.dart';
import 'package:instagram/feature/signup/view/signup_screen.dart';
import 'package:instagram/feature/splash/view/splash_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    log('Route: ${settings.name}');
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/'),
          builder: (_) => const Scaffold(),
        );
      case SplashScreen.routeName:
        return SplashScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case SignupScreen.routeName:
        return SignupScreen.route();
      case NavScreen.routeName:
        return NavScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> onGenerateNestedRoute(RouteSettings settings) {
    log('Nested Route: ${settings.name}');
    switch (settings.name) {
      case ProfileEditScreen.routeName:
        return ProfileEditScreen.route(args: settings.arguments! as ProfileEditScreenArgs);
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(
        name: '/error',
      ),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong'),
        ),
      ),
    );
  }
}
