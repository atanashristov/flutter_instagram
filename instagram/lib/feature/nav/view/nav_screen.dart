import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/feature/nav/cubit/bottom_nav_bar_cubit.dart';
import 'package:instagram/feature/nav/model/bottom_nav_item.dart';
import 'package:instagram/feature/nav/widget/bottom_nav_bar.dart';

class NavScreen extends StatelessWidget {
  const NavScreen({super.key});

  static const String routeName = '/nav';

  // Use `PageRouteBuilder` with `transitionDuration = 0`
  // so that the login appears above the splash screen
  static Route<dynamic> route() => PageRouteBuilder(
        settings: const RouteSettings(name: routeName),
        transitionDuration: Duration.zero,
        pageBuilder: (_, __, ___) => BlocProvider<BottomNavBarCubit>(
          create: (_) => BottomNavBarCubit()..updateSelectedItem(BottomNavItem.feed),
          child: const NavScreen(),
        ),
      );

  Map<BottomNavItem, IconData> get navItems => {
        BottomNavItem.feed: BottomNavItem.feed.defaultIcon,
        BottomNavItem.search: BottomNavItem.search.defaultIcon,
        BottomNavItem.create: BottomNavItem.create.defaultIcon,
        BottomNavItem.notifications: BottomNavItem.notifications.defaultIcon,
        BottomNavItem.profile: BottomNavItem.profile.defaultIcon,
      };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          return Scaffold(
            body: const Center(child: Text('Nav screen')),
            bottomNavigationBar: BottomNavBar(
              items: navItems,
              selectedItem: state.selectedItem,
              onTap: (index) {
                context.read<BottomNavBarCubit>().updateSelectedItem(navItems.keys.toList()[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
