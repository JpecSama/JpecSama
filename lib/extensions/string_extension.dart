extension StringExtension on String {
  String toComparableString() =>
      toLowerCase().replaceAll(RegExp(r'\([^)]*\)'), '').trim();
}
