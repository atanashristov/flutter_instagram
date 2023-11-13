import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:instagram/app/config/app_router.dart';
import 'package:instagram/app/l10n/l10n.dart';
import 'package:instagram/feature/auth/bloc/auth_bloc.dart';
import 'package:instagram/feature/auth/data/auth_repo.dart';
import 'package:instagram/feature/auth/data/auth_repo_impl.dart';
import 'package:instagram/feature/profile/data/profile_repo.dart';
import 'package:instagram/feature/profile/data/profile_repo_impl.dart';
import 'package:instagram/feature/splash/view/splash_screen.dart';
import 'package:instagram/feature/user/data/user_repo.dart';
import 'package:instagram/feature/user/data/user_repo_impl.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // AuthRepoImpl().logOut();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepo>(create: (_) => AuthRepoImpl()),
        RepositoryProvider<UserRepo>(create: (_) => UserRepoImpl()),
        RepositoryProvider<ProfileRepo>(create: (_) => ProfileRepoImpl()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepo: context.read<AuthRepo>(),
            ),
          ),
        ],
        child: MaterialApp(
          onGenerateTitle: (context) => context.l10n.appTitle,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            appBarTheme: AppBarTheme(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              iconTheme: const IconThemeData(color: Colors.black),
              titleTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.grey[100],
          ),
          localizationsDelegates: const [
            ...AppLocalizations.localizationsDelegates,
            FormBuilderLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        ),
      ),
    );
  }
}
