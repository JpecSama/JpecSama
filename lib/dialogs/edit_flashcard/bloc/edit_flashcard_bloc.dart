import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/flashcard.dart';

part 'edit_flashcard_event.dart';
part 'edit_flashcard_state.dart';
part 'edit_flashcard_bloc.freezed.dart';

class EditFlashcardBloc extends Bloc<EditFlashcardEvent, EditFlashcardState> {
  final Flashcard initialFlashcard;
  EditFlashcardBloc({required this.initialFlashcard})
      : super(EditFlashcardState(flashcard: initialFlashcard)) {
    on<_Submitted>(_onSubmitted);
    on<_Started>(_onStarted);
  }

  _onStarted(_Started event, Emitter<EditFlashcardState> emit) {}
  _onSubmitted(_Submitted event, Emitter<EditFlashcardState> emit) {}
}
