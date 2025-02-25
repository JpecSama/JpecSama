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

  @override
  void initState() {
    super.initState();
    maxCount = 10;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        DropdownSelector(
          flashcardCount: widget.flashcardCount,
          onChanged: (int newValue) {
            setState(() {
              maxCount = newValue;
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            context.pushNamed(
              ReviewPage.routeName,
              queryParameters: {
                'maxCount': maxCount.toString(),
              },
            );
          },
          child: Text(
              "${widget.flashcardCount} Review${widget.flashcardCount > 1 ? 's' : ''} ($maxCount)"),
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
    selectedValue = 0; // Default selection
  }

  @override
  Widget build(BuildContext context) {
    int maxValue = min(100, widget.flashcardCount);
    List<int> options = [for (int i = 0; i <= maxValue; i += 10) i];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: mizuasagi,
      ),
      child: DropdownButton<int>(
        value: selectedValue,
        underline: Container(),
        alignment: Alignment.center,
        items: options.map((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
        onChanged: (int? newValue) {
          if (newValue != null) {
            setState(() => selectedValue = newValue);
            widget.onChanged(newValue);
          }
        },
      ),
    );
  }
}
