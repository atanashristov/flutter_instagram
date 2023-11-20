import 'package:flutter/material.dart';

import 'package:instagram/ui/features/nav/models/bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.items,
    required this.onTap,
    this.selectedItem,
    super.key,
  });

  final Map<BottomNavItem, IconData> items;
  final BottomNavItem? selectedItem;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final currentIndex = selectedItem != null ? items.keys.toList().indexOf(selectedItem!) : 0;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: currentIndex >= 0 ? currentIndex : 0,
      items: items
          .map(
            (item, icon) => MapEntry(
              item.toString(),
              BottomNavigationBarItem(
                label: '',
                icon: Icon(icon, size: 30),
              ),
            ),
          )
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
