import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/theme/custom_bottom_nav_bar/bloc/custom_nav_bar_bloc.dart';

import '../../pages/home/home_page.dart';
import '../../pages/list/list_page.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBottomNavBarContent();
  }
}

class CustomBottomNavBarContent extends StatelessWidget {
  const CustomBottomNavBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      BottomNavigationBarItem(
        label: HomePage.routeName,
        icon: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            context.read<CustomNavBarBloc>().add(
                const CustomNavBarEvent.navigate(
                    routeName: HomePage.routeName));
            // context.pushNamed(HomePage.routeName);
          },
        ),
      ),
      BottomNavigationBarItem(
        label: ListPage.routeName,
        icon: IconButton(
          icon: const Icon(Icons.list),
          onPressed: () {
            // context.pushNamed(ListPage.routeName);
            context.read<CustomNavBarBloc>().add(
                const CustomNavBarEvent.navigate(
                    routeName: ListPage.routeName));
          },
        ),
      ),
    ];

    return BlocBuilder<CustomNavBarBloc, CustomNavBarState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        int currentIndex = 0;
        for (var i = 0; i < items.length; i++) {
          if (items[i].label == state.currentRoute) {
            currentIndex = i;
          }
        }
        return BottomNavigationBar(
          currentIndex: currentIndex,
          items: items,
        );
      },
    );
  }
}
