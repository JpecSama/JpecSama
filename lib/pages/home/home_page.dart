import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/pages/account/account_page.dart';
import 'package:jpec_sama/pages/review/review_page.dart';
import 'package:jpec_sama/repositories/review_repository.dart';
import 'package:jpec_sama/theme/theme_title.dart';

import '../../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _future = ReviewRepository.getCardsToReview();
  final _countFuture = ReviewRepository.getCardsToReviewCount();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(AccountPage.routeName);
            },
            icon: const Icon(Icons.person),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ThemeTitle(
              title: context.translations.helloWorld,
            ),
            Expanded(
              child: FutureBuilder(
                future: _future,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final flashcards = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: flashcards.length,
                    itemBuilder: ((context, index) {
                      final flashcard = flashcards[index];
                      return ListTile(
                        title: Text(flashcard.flashcardText),
                        subtitle: flashcard.hint != null
                            ? Text(flashcard.hint!)
                            : null,
                      );
                    }),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed(ReviewPage.routeName);
              },
              child: FutureBuilder(
                  future: _countFuture,
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return const Text('? Review');
                    }
                    if (snap.hasData && snap.data != null) {
                      final flashcards = snap.data!;
                      return Text(
                          "$flashcards Review${flashcards > 1 ? 's' : ''}");
                    }
                    return Container();
                  }),
              // child: Text('Review'),
            ),
          ],
        ),
      ),
    );
  }
}
