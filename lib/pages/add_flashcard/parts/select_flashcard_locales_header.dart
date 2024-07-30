import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jpec_sama/extensions/context_extension.dart';

import '../../../constants.dart';
import '../../../services/language_service.dart';
import '../bloc/add_flashcard_bloc.dart';

class SelectFlashcardLocalesHeader extends StatelessWidget {
  const SelectFlashcardLocalesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: kPadding,
        bottom: 2 * kPadding,
      ),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: kPadding,
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'From',
                      style: context.textTheme.labelMedium,
                    ),
                    BlocBuilder<AddFlashcardBloc, AddFlashcardState>(
                      buildWhen: (previous, current) =>
                          previous.sourceLocale != current.sourceLocale,
                      builder: (context, state) {
                        return CountryCodePicker(
                          hideMainText: true,
                          onChanged: (CountryCode code) {
                            final countryToLanguageMap =
                                LanguageService.countryToLanguageCode;
                            String countryCode =
                                code.code.toString().toUpperCase();
                            print("countryCode $countryCode");
                            if (!countryToLanguageMap
                                .containsKey(countryCode)) {
                              context.showSnackBar(
                                  'This country has no locale mapping currently. Please create a bug');
                              return;
                            }
                            context.read<AddFlashcardBloc>().add(
                                AddFlashcardEvent.sourceLocaleChanged(
                                    newLocale:
                                        countryToLanguageMap[countryCode]!));
                          },
                          initialSelection: LanguageService
                              .countryToLanguageCode.entries
                              .where((entry) =>
                                  entry.value ==
                                  state.sourceLocale.toUpperCase())
                              .firstOrNull
                              ?.key,
                          showCountryOnly: true,
                          showOnlyCountryWhenClosed: true,
                          alignLeft: true,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<AddFlashcardBloc, AddFlashcardState>(
            buildWhen: (previous, current) =>
                previous.sourceLocale != current.sourceLocale ||
                previous.destLocale != current.destLocale,
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  context
                      .read<AddFlashcardBloc>()
                      .add(const AddFlashcardEvent.localeSwitched());
                },
                icon: const Icon(Icons.swap_horizontal_circle_outlined),
              );
            },
          ),
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: kPadding,
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      'To',
                      style: context.textTheme.labelMedium,
                    ),
                    BlocBuilder<AddFlashcardBloc, AddFlashcardState>(
                      buildWhen: (previous, current) =>
                          previous.destLocale != current.destLocale,
                      builder: (context, state) {
                        return CountryCodePicker(
                          hideMainText: true,
                          onChanged: (CountryCode code) {
                            final map = LanguageService.countryToLanguageCode;
                            String countryCode =
                                code.code.toString().toUpperCase();
                            if (!map.containsKey(countryCode)) {
                              context.showSnackBar(
                                  'This country has no locale mapping currently. Please create a bug');
                              return;
                            }

                            context.read<AddFlashcardBloc>().add(
                                AddFlashcardEvent.destLocaleChanged(
                                    newLocale: map[countryCode]!));
                          },
                          initialSelection: LanguageService
                              .countryToLanguageCode.entries
                              .where((entry) =>
                                  entry.value == state.destLocale.toUpperCase())
                              .firstOrNull
                              ?.key,
                          showCountryOnly: true,
                          showOnlyCountryWhenClosed: true,
                          showDropDownButton: false,
                          alignLeft: true,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
