import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review'),
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
