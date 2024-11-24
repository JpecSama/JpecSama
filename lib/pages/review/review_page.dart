// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/pages/review/review_page_content.dart';

import 'bloc/review_bloc.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});
  static const routeName = 'review';

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  void initState() {
    super.initState();
    // AwesomeNotifications().cancel(57);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewBloc()..add(const ReviewEvent.started()),
      child: const ReviewPageContent(),
    );
  }
}
