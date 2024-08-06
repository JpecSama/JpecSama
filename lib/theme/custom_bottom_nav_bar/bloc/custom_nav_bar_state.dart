part of 'custom_nav_bar_bloc.dart';

@freezed
class CustomNavBarState with _$CustomNavBarState {
  const factory CustomNavBarState({
    required String currentRoute,
  }) = _CustomNavBarState;
}
