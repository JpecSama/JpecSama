import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/pages/list/list_tab.dart';

import '../../services/notification_service.dart';
import '../../theme/custom_bottom_nav_bar/bloc/custom_nav_bar_bloc.dart';
import '../../theme/custom_bottom_nav_bar/custom_bottom_nav_bar.dart';
import '../home/home_tab.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static const routeName = 'dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<Dashboard> {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    NotificationService.askForNotificationPermissions(context);
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int? _getIndexFromRoute(String routeName) {
    switch (routeName) {
      case HomeTab.tabName:
        return 0;
      case ListTab.tabName:
        return 1;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: BlocListener<CustomNavBarBloc, CustomNavBarState>(
        listenWhen: (previous, current) =>
            previous.currentRoute != current.currentRoute,
        listener: (context, state) {
          int? index = _getIndexFromRoute(state.currentRoute);
          if (index != null) {
            _tabController.animateTo(index);
          }
        },
        child: TabBarView(controller: _tabController, children: const [
          HomeTab(),
          ListTab(),
        ]),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
