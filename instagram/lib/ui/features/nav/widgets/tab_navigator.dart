import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/app/configs/app_router.dart';
import 'package:instagram/domain/repositories/user_repository.dart';
import 'package:instagram/domain/use_cases/get_user/get_user.dart';
import 'package:instagram/ui/features/auth/bloc/auth_bloc.dart';
import 'package:instagram/ui/features/feed/view/feed_screen.dart';
import 'package:instagram/ui/features/nav/models/bottom_nav_item.dart';
import 'package:instagram/ui/features/notifications/view/notifications_screen.dart';
import 'package:instagram/ui/features/posts/view/create_post_screen.dart';
import 'package:instagram/ui/features/profile/bloc/profile_bloc.dart';
import 'package:instagram/ui/features/profile/view/profile_screen.dart';
import 'package:instagram/ui/features/search/view/search_screen.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator({
    required this.navigatorKey,
    required this.item,
    super.key,
  });

  static const String _kTabNavigatorRoot = '/';

  final GlobalKey<NavigatorState> navigatorKey;
  final BottomNavItem item;

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders();
    return Navigator(
      key: navigatorKey,
      initialRoute: _kTabNavigatorRoot,
      onGenerateInitialRoutes: (_, initialRoute) {
        return [
          MaterialPageRoute(
            settings: const RouteSettings(name: _kTabNavigatorRoot),
            builder: (context) => routeBuilders[initialRoute]!(context),
          ),
        ];
      },
      onGenerateRoute: AppRouter.onGenerateNestedRoute,
    );
  }

  Map<String, WidgetBuilder> _routeBuilders() {
    return {
      _kTabNavigatorRoot: (context) => _getScreen(context, item),
    };
  }

  Widget _getScreen(BuildContext context, BottomNavItem item) {
    switch (item) {
      case BottomNavItem.feed:
        return const FeedScreen();
      case BottomNavItem.search:
        return const SearchScreen();
      case BottomNavItem.create:
        return const CreatePostScreen();
      case BottomNavItem.notifications:
        return const NotificationsScreen();
      case BottomNavItem.profile:
        return BlocProvider<ProfileBloc>(
          create: (_) => ProfileBloc(
            getUser: GetUser(userRepository: context.read<UserRepository>()),
            authBloc: context.read<AuthBloc>(),
          )..add(ProfileLoadUser(userId: context.read<AuthBloc>().state.user?.uid ?? '')),
          child: const ProfileScreen(),
        );
    }
  }
}
