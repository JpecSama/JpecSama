import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:jpec_sama/extensions/context_extension.dart';

import '../../dialogs/edit_flashcard/edit_card_dialog.dart';
import '../../models/flashcard.dart';
import '../../repositories/review_repository.dart';
import '../../theme/custom_bottom_nav_bar/custom_bottom_nav_bar.dart';
import '../../utils/debouncer.dart';
import '../add_flashcard/parts/select_locale_direction.dart';
import 'flashcard_fulltile.dart';

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
  late TextEditingController _searchController;
  final _debouncer = Debouncer(duration: const Duration(seconds: 1));

  final _repo = ReviewRepository();
  String _sourceLocale = 'EN';
  String _destLocale = 'JA';

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    _searchController = TextEditingController();
    _searchController.addListener(() {
      _debouncer.run(() => _pagingController.refresh());
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await _repo.getAllCards(
        page: pageKey,
        limit: _pageSize,
        sourceLocale: _sourceLocale,
        destLocale: _destLocale,
        searchText: _searchController.text.trim(),
      );
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
      body: SafeArea(
        child: Column(
          children: [
            SelectLocaleDirection(
              initialSourceLocale: _sourceLocale,
              initialDestLocale: _destLocale,
              onLocaleSwitched: () {
                String tmpLocale = _sourceLocale;
                setState(() {
                  _sourceLocale = _destLocale;
                  _destLocale = tmpLocale;
                });
                _pagingController.refresh();
              },
              onSourceLocaleChanged: (locale) {
                if (locale != _sourceLocale) {
                  setState(() {
                    _sourceLocale = locale;
                  });
                  _fetchPage(0);
                }
              },
              onDestLocaleChanged: (locale) {
                if (locale != _destLocale) {
                  setState(() {
                    _destLocale = locale;
                  });
                  _fetchPage(0);
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _searchController,
                decoration: const InputDecoration(
                    label: Text("Search"),
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
            ),
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
                      child: FlashcardFulltile(
                        flashcard: flashcard,
                      ),
                      // child: FlashcardTile(
                      //   flashcard: flashcard,
                      // ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}

class FlashcardTile extends StatelessWidget {
  const FlashcardTile({
    super.key,
    required this.flashcard,
  });
  final Flashcard flashcard;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return EditCardDialog(
                flashcard: flashcard,
              );
            });
      },
      title: Text.rich(
        TextSpan(
          children: ([
            TextSpan(
              text: flashcard.flashcardText,
            ),
            flashcard.hint != null
                ? TextSpan(
                    text: '- ${flashcard.hint!}',
                    style: context.textTheme.labelMedium,
                  )
                : null
          ].where((span) => span != null).map((span) => span as TextSpan))
              .toList(),
        ),
      ),
      subtitle: Text(
        flashcard.flashcardAnswer.map((ans) => ans.answer).join(', '),
      ),
    );
  }
}
