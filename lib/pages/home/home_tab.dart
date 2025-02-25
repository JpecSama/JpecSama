import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jpec_sama/constants.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/pages/account/account_page.dart';
import 'package:jpec_sama/pages/add_flashcard/add_flashcard_page.dart';
import 'package:jpec_sama/pages/home/start_review_button.dart';
import 'package:jpec_sama/pages/review/review_page.dart';
import 'package:jpec_sama/repositories/review_repository.dart';
import 'package:jpec_sama/widgets/japanese_text_field/japanese_text_field.dart';
import '../review_graph/review_graph.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});
  static const tabName = 'Home';

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final _repo = ReviewRepository();
  late Future<int> _countFuture;
  late Future<List<Flashcard>> _graphFuture;

  @override
  void initState() {
    _countFuture = _repo.getCardsToReviewCount();
    _graphFuture = _repo.getCardsToReviewCountPerHour();
    super.initState();
  }

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
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/cherry_no_bg.png'),
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              const JapaneseTextField(),
              FutureBuilder<List<Flashcard>>(
                future: _graphFuture,
                initialData: const [],
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return ReviewGraph(
                    flashcards: snapshot.data ?? [],
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: kPadding * 2),
                child: Center(
                  child: FutureBuilder(
                      future: _countFuture,
                      builder: (context, snap) {
                        if (snap.connectionState == ConnectionState.waiting) {
                          return ElevatedButton(
                            onPressed: () {
                              context.pushNamed(ReviewPage.routeName);
                            },
                            child: const Text('? Review'),
                          );
                        }
                        if (snap.hasData &&
                            snap.data != null &&
                            snap.data != 0) {
                          final flashcardCount = snap.data!;
                          return StartReviewButton(
                            flashcardCount: flashcardCount,
                          );
                        }
                        return SizedBox.shrink();
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.pushNamed(AddFlashcardPage.routeName);
        },
        label: const Icon(Icons.add),
      ),
    );
  }
}
