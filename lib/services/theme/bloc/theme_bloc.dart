// import 'package:enter_train_me/services/theme_service.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:enter_train_me/theme/custom_theme.dart';

// part 'theme_event.dart';
// part 'theme_state.dart';

// class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
//   // final ThemeRepository _themeRepository;

//   ThemeBloc(
//       // {
//       // required ThemeRepository themeRepository,
//       // }
//       )
//       :
//         // _themeRepository = themeRepository,
//         super(ThemeState(customTheme: CustomTheme.blueTheme())) {
//     on<ThemeStarted>(_onThemeStarted);
//     on<ThemeChanged>(_onThemeChanged);
//   }

//   void _onThemeStarted(ThemeStarted event, Emitter<ThemeState> emit) async {
//     CustomTheme customTheme = await ThemeService.loadSavedTheme();
//     emit(state.copyWith(customTheme: customTheme));
//   }

//   void _onThemeChanged(ThemeChanged event, Emitter<ThemeState> emit) async {
//     await ThemeService.saveTheme(event.theme);
//     emit(state.copyWith(customTheme: event.theme));
//   }
// }
