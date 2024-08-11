import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/pages/list/list_page.dart';

import '../../services/notification_service.dart';
import '../../theme/custom_bottom_nav_bar/bloc/custom_nav_bar_bloc.dart';
import '../home/home_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  static const routeName = 'dashboard';

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with
        TickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<DashboardPage> {
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
      case HomePage.routeName:
        return 0;
      case ListPage.routeName:
        return 1;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<CustomNavBarBloc, CustomNavBarState>(
      listenWhen: (previous, current) =>
          previous.currentRoute != current.currentRoute,
      listener: (context, state) {
        int? index = _getIndexFromRoute(state.currentRoute);
        if (index != null) {
          _tabController.animateTo(index);
        }
      },
      child: TabBarView(controller: _tabController, children: const [
        HomePage(),
        ListPage(),
      ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
