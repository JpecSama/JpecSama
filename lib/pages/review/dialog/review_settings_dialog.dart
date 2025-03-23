import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/pages/review/bloc/review_bloc.dart';
import 'package:jpec_sama/theme/custom_theme.dart';

class ReviewSettingsDialog extends StatelessWidget {
  const ReviewSettingsDialog({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: CustomTheme.shironeri,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Column(
          children: [
            AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close),
              ),
              title: Text('Settings'),
            ),
            BlocBuilder<ReviewBloc, ReviewState>(
              buildWhen: (previous, current) =>
                  previous.shouldAlwaysShowAnswer !=
                  current.shouldAlwaysShowAnswer,
              builder: (context, state) {
                return ListTile(
                  title: const Text('Always show answer'),
                  subtitle: const Text(
                      'Show the answer immediately after submitting your answer'),
                  trailing: Switch(
                    value: state.shouldAlwaysShowAnswer,
                    onChanged: (value) {
                      context.read<ReviewBloc>().add(
                            ReviewEvent.alwaysShowAnswerToggled(),
                          );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
