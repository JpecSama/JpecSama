import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jpec_sama/theme/custom_theme.dart';

part 'custom_theme_event.dart';
part 'custom_theme_state.dart';
part 'custom_theme_bloc.freezed.dart';

class CustomThemeBloc extends Bloc<CustomThemeEvent, CustomThemeState> {
  CustomThemeBloc()
      : super(CustomThemeState(
          themeData: CustomTheme.defaultTheme,
        )) {
    on<CustomThemeEvent>((event, emit) {});
  }
}
