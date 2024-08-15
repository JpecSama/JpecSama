import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/theme/custom_bottom_nav_bar/bloc/custom_nav_bar_bloc.dart';

import '../../pages/home/home_tab.dart';
import '../../pages/list/list_tab.dart';

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
      const BottomNavigationBarItem(
        label: HomeTab.tabName,
        icon: Icon(Icons.home),
      ),
      const BottomNavigationBarItem(
        label: ListTab.tabName,
        icon: Icon(Icons.list),
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
          onTap: (index) {
            context.read<CustomNavBarBloc>().add(
                CustomNavBarEvent.navigate(routeName: items[index].label!));
          },
          currentIndex: currentIndex,
          items: items,
        );
      },
    );
  }
}
