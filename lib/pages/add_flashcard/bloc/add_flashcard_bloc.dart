import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jpec_sama/models/api/translator_api.dart';

part 'add_flashcard_event.dart';
part 'add_flashcard_state.dart';
part 'add_flashcard_bloc.freezed.dart';
part 'add_flashcard_bloc.g.dart';

class AddFlashcardBloc extends Bloc<AddFlashcardEvent, AddFlashcardState> {
  AddFlashcardBloc()
      : super(const AddFlashcardState(
          sourceLocale: 'JA',
          destLocale: 'EN',
          searchText: '',
        )) {
    on<_Started>(_onStarted);
    on<_SourceLocaleChanged>(_onSourceLocaleChanged);
    on<_DestLocaleChanged>(_onDestLocaleChanged);
    on<_SearchTextChanged>(_onSearchTextChanged);
    on<_ReversableToggled>(_onReversableToggled);
    on<_FormSubmitted>(_onFormSubmitted);
    on<_LocaleSwitched>(_onLocaleSwitched);
  }

  _onStarted(_Started event, Emitter<AddFlashcardState> emit) async {
    final hiveBox = await Hive.openBox('add_flashcard');
    String sourceLocale = hiveBox.get('source_locale', defaultValue: 'JA');
    String destLocale = hiveBox.get('dest_locale', defaultValue: 'EN');

    emit(state.copyWith(sourceLocale: sourceLocale, destLocale: destLocale));
  }

  _onReversableToggled(
      _ReversableToggled event, Emitter<AddFlashcardState> emit) {
    emit(state.copyWith(isReversable: !state.isReversable));
  }

  _onLocaleSwitched(
      _LocaleSwitched event, Emitter<AddFlashcardState> emit) async {
    final hiveBox = await Hive.openBox('add_flashcard');
    hiveBox.put('source_locale', state.destLocale);
    hiveBox.put('dest_locale', state.sourceLocale);

    emit(state.copyWith(
        sourceLocale: state.destLocale, destLocale: state.sourceLocale));
  }

  _onSourceLocaleChanged(
      _SourceLocaleChanged event, Emitter<AddFlashcardState> emit) async {
    final hiveBox = await Hive.openBox('add_flashcard');
    hiveBox.put('source_locale', event.newLocale);

    emit(state.copyWith(sourceLocale: event.newLocale));
  }

  _onDestLocaleChanged(
      _DestLocaleChanged event, Emitter<AddFlashcardState> emit) async {
    final hiveBox = await Hive.openBox('add_flashcard');
    hiveBox.put('dest_locale', event.newLocale);

    emit(state.copyWith(destLocale: event.newLocale));
  }

  _onSearchTextChanged(
      _SearchTextChanged event, Emitter<AddFlashcardState> emit) {
    emit(state.copyWith(searchText: event.searchText));
  }

  _onFormSubmitted(_FormSubmitted event, Emitter<AddFlashcardState> emit) {
    //
  }
}
