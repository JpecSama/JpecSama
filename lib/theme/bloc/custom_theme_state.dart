part of 'custom_theme_bloc.dart';

@freezed
class CustomThemeState with _$CustomThemeState {
  const factory CustomThemeState({
    required ThemeData themeData,
  }) = _CustomThemeState;
}
