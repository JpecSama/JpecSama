import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jpec_sama/main.dart';
import 'package:jpec_sama/pages/review/review_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _future = supabase.from('flashcard').select();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final flashcards = snapshot.data!;
                return ListView.builder(
                  itemCount: flashcards.length,
                  itemBuilder: ((context, index) {
                    final flashcard = flashcards[index];
                    return ListTile(
                      title: Text(flashcard['flashcard_text']),
                      subtitle: Text(flashcard['hint']),
                    );
                  }),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed(ReviewPage.routeName);
            },
            child: Text('Review'),
          ),
        ],
      ),
    );
  }
}
