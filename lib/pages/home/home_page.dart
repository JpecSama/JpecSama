import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jpec_sama/constants.dart';
import 'package:jpec_sama/models/flashcard.dart';
import 'package:jpec_sama/pages/account/account_page.dart';
import 'package:jpec_sama/pages/add_flashcard/add_flashcard_page.dart';
import 'package:jpec_sama/pages/review/review_page.dart';
import 'package:jpec_sama/repositories/review_repository.dart';
import 'package:jpec_sama/theme/custom_bottom_nav_bar.dart';

import '../review_graph/review_graph.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = 'Home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              FutureBuilder<List<Flashcard>>(
                future: _graphFuture,
                initialData: const [],
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  // if (snapshot.hasData) {
                  //   return const ReviewGraph(
                  //     flashcards: [],
                  //   );
                  // }
                  return ReviewGraph(
                    // flashcards: [
                    //   Flashcard.fromJson({
                    //     'id': '1c394b7b-d3dc-47ba-b29a-2f1540fa3b08',
                    //     'type': 'vocabulary',
                    //     'created_at': '2024-07-22 20:08:28.550862+00',
                    //     'level': 3,
                    //     'next_available_at': '2024-08-01 15:54:30.424131+00',
                    //     'flashcard_text': '決済する',
                    //     'hint': 'けっさいする',
                    //     'answer_infos': '',
                    //     'source_language': 'JP',
                    //     'dest_language': 'EN',
                    //     'user_id': '8ae19b21-cc54-472c-9d01-811762bd5450'
                    //   }),
                    //   Flashcard.fromJson({
                    //     'id': '951174fd-7eae-4a78-a724-38950ebd60f6',
                    //     'type': 'vocabulary',
                    //     'created_at': '2024-07-22 20:14:10.760049+00',
                    //     'level': 3,
                    //     'next_available_at': '2024-08-01 15:54:30.424131+00',
                    //     'flashcard_text': '政権',
                    //     'hint': 'せいけん',
                    //     'answer_infos': '',
                    //     'source_language': 'JP',
                    //     'dest_language': 'EN',
                    //     'user_id': '8ae19b21-cc54-472c-9d01-811762bd5450'
                    //   })
                    // ],
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
                        if (snap.hasData && snap.data != null) {
                          final flashcardCount = snap.data!;
                          return ElevatedButton(
                            onPressed: flashcardCount == 0
                                ? null
                                : () {
                                    context.pushNamed(ReviewPage.routeName);
                                  },
                            child: Text(
                                "$flashcardCount Review${flashcardCount > 1 ? 's' : ''}"),
                          );
                        }
                        return Container();
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
      bottomNavigationBar: const CustomBottomNavBar(
        currentRouteName: HomePage.routeName,
      ),
    );
  }
}
