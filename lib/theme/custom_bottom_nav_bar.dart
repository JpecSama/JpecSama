import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/home/home_page.dart';
import '../pages/list/list_page.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key, required this.currentRouteName});
  final String currentRouteName;

  @override
  Widget build(BuildContext context) {
    final items = [
      BottomNavigationBarItem(
        label: HomePage.routeName,
        icon: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            context.pushNamed(HomePage.routeName);
          },
        ),
      ),
      BottomNavigationBarItem(
        label: ListPage.routeName,
        icon: IconButton(
          icon: const Icon(Icons.list),
          onPressed: () {
            context.pushNamed(ListPage.routeName);
          },
        ),
      ),
    ];
    int currentIndex = 0;
    for (var i = 0; i < items.length; i++) {
      if (items[i].label == currentRouteName) {
        currentIndex = i;
      }
    }
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: items,
    );
  }
}
