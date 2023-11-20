import 'package:flutter/material.dart';

enum BottomNavItem {
  feed(defaultIcon: Icons.home),
  search(defaultIcon: Icons.search),
  create(defaultIcon: Icons.add),
  notifications(defaultIcon: Icons.favorite_border),
  profile(defaultIcon: Icons.account_circle),
  ;

  const BottomNavItem({required this.defaultIcon});

  final IconData defaultIcon;
}
