import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jpec_sama/pages/review/review_page.dart';
import 'package:jpec_sama/theme/custom_theme.dart';

class StartReviewButton extends StatefulWidget {
  const StartReviewButton({
    super.key,
    required this.flashcardCount,
  });

  final int flashcardCount;

  @override
  State<StartReviewButton> createState() => _StartReviewButtonState();
}

class _StartReviewButtonState extends State<StartReviewButton> {
  late int maxCount;
  late int count;

  @override
  void initState() {
    super.initState();
    maxCount = min(100, widget.flashcardCount);
    count = maxCount;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            context.pushNamed(
              ReviewPage.routeName,
              queryParameters: {
                'maxCount': count.toString(),
              },
            );
          },
          child: Row(
            children: [
              DropdownSelector(
                flashcardCount: maxCount,
                onChanged: (int newValue) {
                  setState(() {
                    count = newValue;
                  });
                },
              ),
              Text("Review${widget.flashcardCount > 1 ? 's' : ''}"),
            ],
          ),
        ),
      ],
    );
  }
}

class DropdownSelector extends StatefulWidget {
  final int flashcardCount;
  final Function(int) onChanged;

  const DropdownSelector({
    super.key,
    required this.flashcardCount,
    required this.onChanged,
  });

  @override
  State<DropdownSelector> createState() => _DropdownSelectorState();
}

class _DropdownSelectorState extends State<DropdownSelector> {
  late int selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.flashcardCount;
  }

  @override
  Widget build(BuildContext context) {
    List<int> options = [
      for (int i = 0; i <= selectedValue; i += 10) i,
      if (selectedValue % 10 != 0) selectedValue,
    ];
    return DropdownButton<int>(
      value: selectedValue,
      iconEnabledColor: Colors.white,
      alignment: Alignment.center,

      items: options.map((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              value.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      }).toList(),
      onChanged: (int? newValue) {
        if (newValue != null) {
          setState(() => selectedValue = newValue);
          widget.onChanged(newValue);
        }
      },
    );
  }
}
