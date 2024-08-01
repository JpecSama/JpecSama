import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jpec_sama/extensions/context_extension.dart';

import '../../models/flashcard.dart';
import '../../repositories/review_repository.dart';
import '../../theme/custom_bottom_nav_bar.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});
  static const routeName = 'List';

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  static const _pageSize = 50;
  final PagingController<int, Flashcard> _pagingController =
      PagingController(firstPageKey: 0);

  final _repo = ReviewRepository();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await _repo.getAllCards(page: pageKey, limit: _pageSize);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PagedListView<int, Flashcard>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Flashcard>(
                itemBuilder: (context, flashcard, index) => Dismissible(
                  key: Key("flashcard_${flashcard.id}"),
                  background: Container(color: Colors.red),
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      bool dismiss = false;
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.amber,
                              title: const Text(
                                  "Are you sure you want to delete the item"),
                              actions: [
                                TextButton(
                                    onPressed: () async {
                                      dismiss = true;
                                      ReviewRepository _repo =
                                          ReviewRepository();

                                      await _repo.deleteCard(flashcard.id!);
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Yes")),
                                TextButton(
                                    onPressed: () {
                                      dismiss = false;
                                      Navigator.pop(context);
                                    },
                                    child: const Text("No")),
                              ],
                            );
                          });
                      return dismiss;
                    }
                    return false;
                  },
                  onDismissed: (direction) {
                    context.showSnackBar('Successfully deleted');
                  },
                  child: Card(
                    child: ListTile(
                      title: Text.rich(
                        TextSpan(
                          children: ([
                            TextSpan(
                              text: flashcard.flashcardText,
                            ),
                            flashcard.hint != null
                                ? TextSpan(text: flashcard.hint!)
                                : null
                          ]
                              .where((span) => span != null)
                              .map((span) => span as TextSpan)).toList(),
                        ),
                      ),
                      subtitle: Text(
                        flashcard.flashcardAnswer
                            .map((ans) => ans.answer)
                            .join(', '),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        currentRouteName: ListPage.routeName,
      ),
    );
  }
}
