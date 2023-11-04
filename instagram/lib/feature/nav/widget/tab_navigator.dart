import 'package:flutter/material.dart';
import 'package:instagram/feature/feed/view/feed_screen.dart';
import 'package:instagram/feature/nav/model/bottom_nav_item.dart';
import 'package:instagram/feature/notifications/view/notifications_screen.dart';
import 'package:instagram/feature/posts/view/create_post_screen.dart';
import 'package:instagram/feature/profile/view/profile_screen.dart';
import 'package:instagram/feature/search/view/search_screen.dart';

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
        return const ProfileScreen();
    }
  }
}
