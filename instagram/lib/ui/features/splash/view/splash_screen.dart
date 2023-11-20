import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/ui/features/auth/bloc/auth_bloc.dart';
import 'package:instagram/ui/features/login/view/login_screen.dart';
import 'package:instagram/ui/features/nav/view/nav_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';

  static Route<dynamic> route() => MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SplashScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status.isUnauthenticated) {
            Navigator.of(context).pushNamed(LoginScreen.routeName);
          } else if (state.status.isAuthenticated) {
            Navigator.of(context).pushNamed(NavScreen.routeName);
          }
        },
        listenWhen: (prevState, state) => prevState.status != state.status,
        child: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
