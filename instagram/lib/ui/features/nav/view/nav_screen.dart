import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/ui/features/nav/cubit/bottom_nav_bar_cubit.dart';
import 'package:instagram/ui/features/nav/models/bottom_nav_item.dart';
import 'package:instagram/ui/features/nav/widgets/bottom_nav_bar.dart';
import 'package:instagram/ui/features/nav/widgets/tab_navigator.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  static const String routeName = '/nav';

  /// Use `PageRouteBuilder` with `transitionDuration = 0`
  /// so that the login appears above the splash screen
  static Route<dynamic> route() => PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        transitionDuration: Duration.zero,
        pageBuilder: (_, __, ___) => BlocProvider<BottomNavBarCubit>(
          create: (_) => BottomNavBarCubit()..updateSelectedItem(BottomNavItem.feed),
          child: const NavScreen(),
        ),
      );

  /// Defines nav keys for each nav item, that we can reference,
  /// so that we have unique navigation stack for each of the nav items.
  static Map<BottomNavItem, GlobalKey<NavigatorState>> navKeys = {
    BottomNavItem.feed: GlobalKey<NavigatorState>(),
    BottomNavItem.search: GlobalKey<NavigatorState>(),
    BottomNavItem.create: GlobalKey<NavigatorState>(),
    BottomNavItem.notifications: GlobalKey<NavigatorState>(),
    BottomNavItem.profile: GlobalKey<NavigatorState>(),
  };

  static Map<BottomNavItem, IconData> get navItems => {
        BottomNavItem.feed: BottomNavItem.feed.defaultIcon,
        BottomNavItem.search: BottomNavItem.search.defaultIcon,
        BottomNavItem.create: BottomNavItem.create.defaultIcon,
        BottomNavItem.notifications: BottomNavItem.notifications.defaultIcon,
        BottomNavItem.profile: BottomNavItem.profile.defaultIcon,
      };

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          // Create a Stack widget with list of Offstage navigators.
          // We actually render all these screens, but we only show the widget
          // that is associated with the selected navigation item.
          return Scaffold(
            body: Stack(
              children: navItems
                  .map(
                    (item, _) => MapEntry(item, _buildOffstageNavigator(item, item == state.selectedItem)),
                  )
                  .values
                  .toList(),
            ),
            bottomNavigationBar: BottomNavBar(
              items: navItems,
              selectedItem: state.selectedItem,
              onTap: (index) {
                final selectedItem = navItems.keys.toList()[index];
                _selectBottomNavItem(
                  context,
                  selectedItem,
                  selectedItem == state.selectedItem,
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _selectBottomNavItem(BuildContext context, BottomNavItem selectedItem, bool isSameItem) {
    if (isSameItem) {
      // pop all the way to the first route of the navigation
      navKeys[selectedItem]?.currentState?.popUntil((route) => route.isFirst);
    }
    context.read<BottomNavBarCubit>().updateSelectedItem(selectedItem);
  }

  Widget _buildOffstageNavigator(
    BottomNavItem currentItem,
    bool isSelected,
  ) {
    return Offstage(
      offstage: !isSelected,
      // We render T
      child: TabNavigator(
        navigatorKey: navKeys[currentItem]!,
        item: currentItem,
      ),
    );
  }
}
