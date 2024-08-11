import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/extensions/context_extension.dart';

import '../../../constants.dart';
import '../../../services/language_service.dart';
import '../bloc/add_flashcard_bloc.dart';
import 'select_locale_direction.dart';

class SelectFlashcardLocalesHeader extends StatelessWidget {
  const SelectFlashcardLocalesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFlashcardBloc, AddFlashcardState>(
      buildWhen: (previous, current) =>
          previous.destLocale != current.destLocale ||
          previous.sourceLocale != current.sourceLocale,
      builder: (context, state) {
        return SelectLocaleDirection(
          initialSourceLocale: state.sourceLocale,
          initialDestLocale: state.destLocale,
          onLocaleSwitched: () {
            context
                .read<AddFlashcardBloc>()
                .add(const AddFlashcardEvent.localeSwitched());
          },
          onSourceLocaleChanged: (locale) {
            context
                .read<AddFlashcardBloc>()
                .add(AddFlashcardEvent.sourceLocaleChanged(newLocale: locale));
          },
          onDestLocaleChanged: (locale) {
            context
                .read<AddFlashcardBloc>()
                .add(AddFlashcardEvent.destLocaleChanged(newLocale: locale));
          },
        );
      },
    );
  }
}
