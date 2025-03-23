import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/theme/custom_theme.dart';

import '../../../constants.dart';
import '../../../services/language_service.dart';

typedef OnLocaleChanged = void Function(String locale);

class SelectLocaleDirection extends StatelessWidget {
  const SelectLocaleDirection({
    super.key,
    required this.onSourceLocaleChanged,
    required this.onDestLocaleChanged,
    required this.onLocaleSwitched,
    this.initialSourceLocale,
    this.initialDestLocale,
  });

  final String? initialSourceLocale;
  final String? initialDestLocale;
  final OnLocaleChanged onSourceLocaleChanged;
  final OnLocaleChanged onDestLocaleChanged;
  final VoidCallback onLocaleSwitched;

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
                  color: CustomTheme.shironeri,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'From',
                      style: context.textTheme.labelMedium,
                    ),
                    CountryCodePicker(
                      hideMainText: true,
                      onChanged: (CountryCode code) {
                        final countryToLanguageMap =
                            LanguageService.countryToLanguageCode;
                        String countryCode = code.code.toString().toUpperCase();
                        print("countryCode $countryCode");
                        if (!countryToLanguageMap.containsKey(countryCode)) {
                          context.showSnackBar(
                              'This country has no locale mapping currently. Please create a bug');
                          return;
                        }
                        onSourceLocaleChanged(
                            countryToLanguageMap[countryCode]!);
                      },
                      initialSelection: initialSourceLocale != null
                          ? LanguageService.countryToLanguageCode.entries
                              .where((entry) =>
                                  entry.value ==
                                  initialSourceLocale!.toUpperCase())
                              .firstOrNull
                              ?.key
                          : null,
                      showCountryOnly: true,
                      showOnlyCountryWhenClosed: true,
                      alignLeft: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              onLocaleSwitched();
            },
            icon: const Icon(
              Icons.swap_horizontal_circle_outlined,
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: kPadding,
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: CustomTheme.shironeri,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      'To',
                      style: context.textTheme.labelMedium,
                    ),
                    CountryCodePicker(
                      hideMainText: true,
                      onChanged: (CountryCode code) {
                        final map = LanguageService.countryToLanguageCode;
                        String countryCode = code.code.toString().toUpperCase();
                        if (!map.containsKey(countryCode)) {
                          context.showSnackBar(
                              'This country has no locale mapping currently. Please create a bug');
                          return;
                        }
                        onDestLocaleChanged(map[countryCode]!);
                      },
                      initialSelection: initialDestLocale != null
                          ? LanguageService.countryToLanguageCode.entries
                              .where((entry) =>
                                  entry.value ==
                                  initialDestLocale!.toUpperCase())
                              .firstOrNull
                              ?.key
                          : null,
                      showCountryOnly: true,
                      showOnlyCountryWhenClosed: true,
                      showDropDownButton: false,
                      alignLeft: true,
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
