import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/pages/review/review_page_content.dart';

import '../../repositories/review_repository.dart';
import 'bloc/review_bloc.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});
  static const routeName = 'review';

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final _repo = ReviewRepository();
  late Future _future;

  @override
  void initState() {
    _future = _repo.getCardsToReview();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final flashcards = snapshot.data!;
        flashcards.shuffle();
        return BlocProvider(
          create: (context) => ReviewBloc(
            flashcards: flashcards,
          ),
          child: const ReviewPageContent(),
        );
      },
    );
  }
}
