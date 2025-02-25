// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/pages/review/review_page_content.dart';

import 'bloc/review_bloc.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({
    super.key,
    required this.maxCount,
  });
  final int maxCount;
  static const routeName = 'review';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewBloc(
        maxCount: maxCount,
      )..add(const ReviewEvent.started()),
      child: const ReviewPageContent(),
    );
  }
}
