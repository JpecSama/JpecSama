import 'package:flutter/material.dart';
import 'package:jpec_sama/router.dart';
import 'package:jpec_sama/theme/theme_dialog.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});
  static const routeName = 'review';

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  late final TextEditingController _answerController = TextEditingController();
  bool _isHintVisible = false;
  String? _hint;

  @override
  void dispose() {
    _answerController.dispose();
    _hint = 'hint';
    super.dispose();
  }

  _showExitReviewConfirmDialog() {
    showDialog(
        context: context,
        builder: (dialogContext) {
          //https://api.flutter.dev/flutter/material/AlertDialog-class.html
          return AlertDialog(
            title: const Text("Exit review?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: Text("Yes"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                child: Text("No"),
              ),
            ],
            elevation: 24.0,
            backgroundColor: Colors.red,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review'),
        leading: IconButton(
          onPressed: _showExitReviewConfirmDialog,
          icon: Icon(Icons.exit_to_app),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.deepPurple,
            child: Center(
              child: Column(
                children: [
                  Text('ToGuess'),
                  _isHintVisible && _hint != null ? Text(_hint!) : Container(),
                ],
              ),
            ),
          ),
          Center(
            child: Text("ReviewPage"),
          ),
          TextFormField(
            controller: _answerController,
            decoration: const InputDecoration(
              labelText: 'Answer',
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
