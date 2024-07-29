// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReviewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String givenAnswer) cardReviewed,
    required TResult Function() nextCard,
    required TResult Function() sessionSaved,
    required TResult Function() sessionCanceled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String givenAnswer)? cardReviewed,
    TResult? Function()? nextCard,
    TResult? Function()? sessionSaved,
    TResult? Function()? sessionCanceled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String givenAnswer)? cardReviewed,
    TResult Function()? nextCard,
    TResult Function()? sessionSaved,
    TResult Function()? sessionCanceled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CardReview value) cardReviewed,
    required TResult Function(_NextCard value) nextCard,
    required TResult Function(_SessionSaved value) sessionSaved,
    required TResult Function(_SessionCanceled value) sessionCanceled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CardReview value)? cardReviewed,
    TResult? Function(_NextCard value)? nextCard,
    TResult? Function(_SessionSaved value)? sessionSaved,
    TResult? Function(_SessionCanceled value)? sessionCanceled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CardReview value)? cardReviewed,
    TResult Function(_NextCard value)? nextCard,
    TResult Function(_SessionSaved value)? sessionSaved,
    TResult Function(_SessionCanceled value)? sessionCanceled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewEventCopyWith<$Res> {
  factory $ReviewEventCopyWith(
          ReviewEvent value, $Res Function(ReviewEvent) then) =
      _$ReviewEventCopyWithImpl<$Res, ReviewEvent>;
}

/// @nodoc
class _$ReviewEventCopyWithImpl<$Res, $Val extends ReviewEvent>
    implements $ReviewEventCopyWith<$Res> {
  _$ReviewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ReviewEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String givenAnswer) cardReviewed,
    required TResult Function() nextCard,
    required TResult Function() sessionSaved,
    required TResult Function() sessionCanceled,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String givenAnswer)? cardReviewed,
    TResult? Function()? nextCard,
    TResult? Function()? sessionSaved,
    TResult? Function()? sessionCanceled,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String givenAnswer)? cardReviewed,
    TResult Function()? nextCard,
    TResult Function()? sessionSaved,
    TResult Function()? sessionCanceled,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CardReview value) cardReviewed,
    required TResult Function(_NextCard value) nextCard,
    required TResult Function(_SessionSaved value) sessionSaved,
    required TResult Function(_SessionCanceled value) sessionCanceled,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CardReview value)? cardReviewed,
    TResult? Function(_NextCard value)? nextCard,
    TResult? Function(_SessionSaved value)? sessionSaved,
    TResult? Function(_SessionCanceled value)? sessionCanceled,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CardReview value)? cardReviewed,
    TResult Function(_NextCard value)? nextCard,
    TResult Function(_SessionSaved value)? sessionSaved,
    TResult Function(_SessionCanceled value)? sessionCanceled,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ReviewEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$CardReviewImplCopyWith<$Res> {
  factory _$$CardReviewImplCopyWith(
          _$CardReviewImpl value, $Res Function(_$CardReviewImpl) then) =
      __$$CardReviewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String givenAnswer});
}

/// @nodoc
class __$$CardReviewImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$CardReviewImpl>
    implements _$$CardReviewImplCopyWith<$Res> {
  __$$CardReviewImplCopyWithImpl(
      _$CardReviewImpl _value, $Res Function(_$CardReviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? givenAnswer = null,
  }) {
    return _then(_$CardReviewImpl(
      givenAnswer: null == givenAnswer
          ? _value.givenAnswer
          : givenAnswer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CardReviewImpl implements _CardReview {
  const _$CardReviewImpl({required this.givenAnswer});

  @override
  final String givenAnswer;

  @override
  String toString() {
    return 'ReviewEvent.cardReviewed(givenAnswer: $givenAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardReviewImpl &&
            (identical(other.givenAnswer, givenAnswer) ||
                other.givenAnswer == givenAnswer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, givenAnswer);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CardReviewImplCopyWith<_$CardReviewImpl> get copyWith =>
      __$$CardReviewImplCopyWithImpl<_$CardReviewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String givenAnswer) cardReviewed,
    required TResult Function() nextCard,
    required TResult Function() sessionSaved,
    required TResult Function() sessionCanceled,
  }) {
    return cardReviewed(givenAnswer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String givenAnswer)? cardReviewed,
    TResult? Function()? nextCard,
    TResult? Function()? sessionSaved,
    TResult? Function()? sessionCanceled,
  }) {
    return cardReviewed?.call(givenAnswer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String givenAnswer)? cardReviewed,
    TResult Function()? nextCard,
    TResult Function()? sessionSaved,
    TResult Function()? sessionCanceled,
    required TResult orElse(),
  }) {
    if (cardReviewed != null) {
      return cardReviewed(givenAnswer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CardReview value) cardReviewed,
    required TResult Function(_NextCard value) nextCard,
    required TResult Function(_SessionSaved value) sessionSaved,
    required TResult Function(_SessionCanceled value) sessionCanceled,
  }) {
    return cardReviewed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CardReview value)? cardReviewed,
    TResult? Function(_NextCard value)? nextCard,
    TResult? Function(_SessionSaved value)? sessionSaved,
    TResult? Function(_SessionCanceled value)? sessionCanceled,
  }) {
    return cardReviewed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CardReview value)? cardReviewed,
    TResult Function(_NextCard value)? nextCard,
    TResult Function(_SessionSaved value)? sessionSaved,
    TResult Function(_SessionCanceled value)? sessionCanceled,
    required TResult orElse(),
  }) {
    if (cardReviewed != null) {
      return cardReviewed(this);
    }
    return orElse();
  }
}

abstract class _CardReview implements ReviewEvent {
  const factory _CardReview({required final String givenAnswer}) =
      _$CardReviewImpl;

  String get givenAnswer;

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CardReviewImplCopyWith<_$CardReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NextCardImplCopyWith<$Res> {
  factory _$$NextCardImplCopyWith(
          _$NextCardImpl value, $Res Function(_$NextCardImpl) then) =
      __$$NextCardImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NextCardImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$NextCardImpl>
    implements _$$NextCardImplCopyWith<$Res> {
  __$$NextCardImplCopyWithImpl(
      _$NextCardImpl _value, $Res Function(_$NextCardImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NextCardImpl implements _NextCard {
  const _$NextCardImpl();

  @override
  String toString() {
    return 'ReviewEvent.nextCard()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NextCardImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String givenAnswer) cardReviewed,
    required TResult Function() nextCard,
    required TResult Function() sessionSaved,
    required TResult Function() sessionCanceled,
  }) {
    return nextCard();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String givenAnswer)? cardReviewed,
    TResult? Function()? nextCard,
    TResult? Function()? sessionSaved,
    TResult? Function()? sessionCanceled,
  }) {
    return nextCard?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String givenAnswer)? cardReviewed,
    TResult Function()? nextCard,
    TResult Function()? sessionSaved,
    TResult Function()? sessionCanceled,
    required TResult orElse(),
  }) {
    if (nextCard != null) {
      return nextCard();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CardReview value) cardReviewed,
    required TResult Function(_NextCard value) nextCard,
    required TResult Function(_SessionSaved value) sessionSaved,
    required TResult Function(_SessionCanceled value) sessionCanceled,
  }) {
    return nextCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CardReview value)? cardReviewed,
    TResult? Function(_NextCard value)? nextCard,
    TResult? Function(_SessionSaved value)? sessionSaved,
    TResult? Function(_SessionCanceled value)? sessionCanceled,
  }) {
    return nextCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CardReview value)? cardReviewed,
    TResult Function(_NextCard value)? nextCard,
    TResult Function(_SessionSaved value)? sessionSaved,
    TResult Function(_SessionCanceled value)? sessionCanceled,
    required TResult orElse(),
  }) {
    if (nextCard != null) {
      return nextCard(this);
    }
    return orElse();
  }
}

abstract class _NextCard implements ReviewEvent {
  const factory _NextCard() = _$NextCardImpl;
}

/// @nodoc
abstract class _$$SessionSavedImplCopyWith<$Res> {
  factory _$$SessionSavedImplCopyWith(
          _$SessionSavedImpl value, $Res Function(_$SessionSavedImpl) then) =
      __$$SessionSavedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionSavedImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$SessionSavedImpl>
    implements _$$SessionSavedImplCopyWith<$Res> {
  __$$SessionSavedImplCopyWithImpl(
      _$SessionSavedImpl _value, $Res Function(_$SessionSavedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SessionSavedImpl implements _SessionSaved {
  const _$SessionSavedImpl();

  @override
  String toString() {
    return 'ReviewEvent.sessionSaved()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SessionSavedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String givenAnswer) cardReviewed,
    required TResult Function() nextCard,
    required TResult Function() sessionSaved,
    required TResult Function() sessionCanceled,
  }) {
    return sessionSaved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String givenAnswer)? cardReviewed,
    TResult? Function()? nextCard,
    TResult? Function()? sessionSaved,
    TResult? Function()? sessionCanceled,
  }) {
    return sessionSaved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String givenAnswer)? cardReviewed,
    TResult Function()? nextCard,
    TResult Function()? sessionSaved,
    TResult Function()? sessionCanceled,
    required TResult orElse(),
  }) {
    if (sessionSaved != null) {
      return sessionSaved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CardReview value) cardReviewed,
    required TResult Function(_NextCard value) nextCard,
    required TResult Function(_SessionSaved value) sessionSaved,
    required TResult Function(_SessionCanceled value) sessionCanceled,
  }) {
    return sessionSaved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CardReview value)? cardReviewed,
    TResult? Function(_NextCard value)? nextCard,
    TResult? Function(_SessionSaved value)? sessionSaved,
    TResult? Function(_SessionCanceled value)? sessionCanceled,
  }) {
    return sessionSaved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CardReview value)? cardReviewed,
    TResult Function(_NextCard value)? nextCard,
    TResult Function(_SessionSaved value)? sessionSaved,
    TResult Function(_SessionCanceled value)? sessionCanceled,
    required TResult orElse(),
  }) {
    if (sessionSaved != null) {
      return sessionSaved(this);
    }
    return orElse();
  }
}

abstract class _SessionSaved implements ReviewEvent {
  const factory _SessionSaved() = _$SessionSavedImpl;
}

/// @nodoc
abstract class _$$SessionCanceledImplCopyWith<$Res> {
  factory _$$SessionCanceledImplCopyWith(_$SessionCanceledImpl value,
          $Res Function(_$SessionCanceledImpl) then) =
      __$$SessionCanceledImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionCanceledImplCopyWithImpl<$Res>
    extends _$ReviewEventCopyWithImpl<$Res, _$SessionCanceledImpl>
    implements _$$SessionCanceledImplCopyWith<$Res> {
  __$$SessionCanceledImplCopyWithImpl(
      _$SessionCanceledImpl _value, $Res Function(_$SessionCanceledImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SessionCanceledImpl implements _SessionCanceled {
  const _$SessionCanceledImpl();

  @override
  String toString() {
    return 'ReviewEvent.sessionCanceled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SessionCanceledImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String givenAnswer) cardReviewed,
    required TResult Function() nextCard,
    required TResult Function() sessionSaved,
    required TResult Function() sessionCanceled,
  }) {
    return sessionCanceled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String givenAnswer)? cardReviewed,
    TResult? Function()? nextCard,
    TResult? Function()? sessionSaved,
    TResult? Function()? sessionCanceled,
  }) {
    return sessionCanceled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String givenAnswer)? cardReviewed,
    TResult Function()? nextCard,
    TResult Function()? sessionSaved,
    TResult Function()? sessionCanceled,
    required TResult orElse(),
  }) {
    if (sessionCanceled != null) {
      return sessionCanceled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CardReview value) cardReviewed,
    required TResult Function(_NextCard value) nextCard,
    required TResult Function(_SessionSaved value) sessionSaved,
    required TResult Function(_SessionCanceled value) sessionCanceled,
  }) {
    return sessionCanceled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_CardReview value)? cardReviewed,
    TResult? Function(_NextCard value)? nextCard,
    TResult? Function(_SessionSaved value)? sessionSaved,
    TResult? Function(_SessionCanceled value)? sessionCanceled,
  }) {
    return sessionCanceled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CardReview value)? cardReviewed,
    TResult Function(_NextCard value)? nextCard,
    TResult Function(_SessionSaved value)? sessionSaved,
    TResult Function(_SessionCanceled value)? sessionCanceled,
    required TResult orElse(),
  }) {
    if (sessionCanceled != null) {
      return sessionCanceled(this);
    }
    return orElse();
  }
}

abstract class _SessionCanceled implements ReviewEvent {
  const factory _SessionCanceled() = _$SessionCanceledImpl;
}

ReviewState _$ReviewStateFromJson(Map<String, dynamic> json) {
  return _ReviewState.fromJson(json);
}

/// @nodoc
mixin _$ReviewState {
  String? get submissionError => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isSessionEnded => throw _privateConstructorUsedError; //
  bool get hasReviewError => throw _privateConstructorUsedError;
  bool get isHintVisible => throw _privateConstructorUsedError;
  bool get isAnswerVisible => throw _privateConstructorUsedError;
  int get currentCardIndex => throw _privateConstructorUsedError;
  List<Flashcard> get flashcards => throw _privateConstructorUsedError;
  List<FlashcardSessionAnswer> get sessionAnswers =>
      throw _privateConstructorUsedError;

  /// Serializes this ReviewState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewStateCopyWith<ReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewStateCopyWith<$Res> {
  factory $ReviewStateCopyWith(
          ReviewState value, $Res Function(ReviewState) then) =
      _$ReviewStateCopyWithImpl<$Res, ReviewState>;
  @useResult
  $Res call(
      {String? submissionError,
      bool isSubmitting,
      bool isSessionEnded,
      bool hasReviewError,
      bool isHintVisible,
      bool isAnswerVisible,
      int currentCardIndex,
      List<Flashcard> flashcards,
      List<FlashcardSessionAnswer> sessionAnswers});
}

/// @nodoc
class _$ReviewStateCopyWithImpl<$Res, $Val extends ReviewState>
    implements $ReviewStateCopyWith<$Res> {
  _$ReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submissionError = freezed,
    Object? isSubmitting = null,
    Object? isSessionEnded = null,
    Object? hasReviewError = null,
    Object? isHintVisible = null,
    Object? isAnswerVisible = null,
    Object? currentCardIndex = null,
    Object? flashcards = null,
    Object? sessionAnswers = null,
  }) {
    return _then(_value.copyWith(
      submissionError: freezed == submissionError
          ? _value.submissionError
          : submissionError // ignore: cast_nullable_to_non_nullable
              as String?,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSessionEnded: null == isSessionEnded
          ? _value.isSessionEnded
          : isSessionEnded // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReviewError: null == hasReviewError
          ? _value.hasReviewError
          : hasReviewError // ignore: cast_nullable_to_non_nullable
              as bool,
      isHintVisible: null == isHintVisible
          ? _value.isHintVisible
          : isHintVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnswerVisible: null == isAnswerVisible
          ? _value.isAnswerVisible
          : isAnswerVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      currentCardIndex: null == currentCardIndex
          ? _value.currentCardIndex
          : currentCardIndex // ignore: cast_nullable_to_non_nullable
              as int,
      flashcards: null == flashcards
          ? _value.flashcards
          : flashcards // ignore: cast_nullable_to_non_nullable
              as List<Flashcard>,
      sessionAnswers: null == sessionAnswers
          ? _value.sessionAnswers
          : sessionAnswers // ignore: cast_nullable_to_non_nullable
              as List<FlashcardSessionAnswer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewStateImplCopyWith<$Res>
    implements $ReviewStateCopyWith<$Res> {
  factory _$$ReviewStateImplCopyWith(
          _$ReviewStateImpl value, $Res Function(_$ReviewStateImpl) then) =
      __$$ReviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? submissionError,
      bool isSubmitting,
      bool isSessionEnded,
      bool hasReviewError,
      bool isHintVisible,
      bool isAnswerVisible,
      int currentCardIndex,
      List<Flashcard> flashcards,
      List<FlashcardSessionAnswer> sessionAnswers});
}

/// @nodoc
class __$$ReviewStateImplCopyWithImpl<$Res>
    extends _$ReviewStateCopyWithImpl<$Res, _$ReviewStateImpl>
    implements _$$ReviewStateImplCopyWith<$Res> {
  __$$ReviewStateImplCopyWithImpl(
      _$ReviewStateImpl _value, $Res Function(_$ReviewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? submissionError = freezed,
    Object? isSubmitting = null,
    Object? isSessionEnded = null,
    Object? hasReviewError = null,
    Object? isHintVisible = null,
    Object? isAnswerVisible = null,
    Object? currentCardIndex = null,
    Object? flashcards = null,
    Object? sessionAnswers = null,
  }) {
    return _then(_$ReviewStateImpl(
      submissionError: freezed == submissionError
          ? _value.submissionError
          : submissionError // ignore: cast_nullable_to_non_nullable
              as String?,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      isSessionEnded: null == isSessionEnded
          ? _value.isSessionEnded
          : isSessionEnded // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReviewError: null == hasReviewError
          ? _value.hasReviewError
          : hasReviewError // ignore: cast_nullable_to_non_nullable
              as bool,
      isHintVisible: null == isHintVisible
          ? _value.isHintVisible
          : isHintVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isAnswerVisible: null == isAnswerVisible
          ? _value.isAnswerVisible
          : isAnswerVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      currentCardIndex: null == currentCardIndex
          ? _value.currentCardIndex
          : currentCardIndex // ignore: cast_nullable_to_non_nullable
              as int,
      flashcards: null == flashcards
          ? _value._flashcards
          : flashcards // ignore: cast_nullable_to_non_nullable
              as List<Flashcard>,
      sessionAnswers: null == sessionAnswers
          ? _value._sessionAnswers
          : sessionAnswers // ignore: cast_nullable_to_non_nullable
              as List<FlashcardSessionAnswer>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewStateImpl extends _ReviewState {
  const _$ReviewStateImpl(
      {this.submissionError,
      this.isSubmitting = false,
      this.isSessionEnded = false,
      this.hasReviewError = false,
      this.isHintVisible = false,
      this.isAnswerVisible = false,
      this.currentCardIndex = 0,
      required final List<Flashcard> flashcards,
      required final List<FlashcardSessionAnswer> sessionAnswers})
      : _flashcards = flashcards,
        _sessionAnswers = sessionAnswers,
        super._();

  factory _$ReviewStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewStateImplFromJson(json);

  @override
  final String? submissionError;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool isSessionEnded;
//
  @override
  @JsonKey()
  final bool hasReviewError;
  @override
  @JsonKey()
  final bool isHintVisible;
  @override
  @JsonKey()
  final bool isAnswerVisible;
  @override
  @JsonKey()
  final int currentCardIndex;
  final List<Flashcard> _flashcards;
  @override
  List<Flashcard> get flashcards {
    if (_flashcards is EqualUnmodifiableListView) return _flashcards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flashcards);
  }

  final List<FlashcardSessionAnswer> _sessionAnswers;
  @override
  List<FlashcardSessionAnswer> get sessionAnswers {
    if (_sessionAnswers is EqualUnmodifiableListView) return _sessionAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessionAnswers);
  }

  @override
  String toString() {
    return 'ReviewState(submissionError: $submissionError, isSubmitting: $isSubmitting, isSessionEnded: $isSessionEnded, hasReviewError: $hasReviewError, isHintVisible: $isHintVisible, isAnswerVisible: $isAnswerVisible, currentCardIndex: $currentCardIndex, flashcards: $flashcards, sessionAnswers: $sessionAnswers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewStateImpl &&
            (identical(other.submissionError, submissionError) ||
                other.submissionError == submissionError) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isSessionEnded, isSessionEnded) ||
                other.isSessionEnded == isSessionEnded) &&
            (identical(other.hasReviewError, hasReviewError) ||
                other.hasReviewError == hasReviewError) &&
            (identical(other.isHintVisible, isHintVisible) ||
                other.isHintVisible == isHintVisible) &&
            (identical(other.isAnswerVisible, isAnswerVisible) ||
                other.isAnswerVisible == isAnswerVisible) &&
            (identical(other.currentCardIndex, currentCardIndex) ||
                other.currentCardIndex == currentCardIndex) &&
            const DeepCollectionEquality()
                .equals(other._flashcards, _flashcards) &&
            const DeepCollectionEquality()
                .equals(other._sessionAnswers, _sessionAnswers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      submissionError,
      isSubmitting,
      isSessionEnded,
      hasReviewError,
      isHintVisible,
      isAnswerVisible,
      currentCardIndex,
      const DeepCollectionEquality().hash(_flashcards),
      const DeepCollectionEquality().hash(_sessionAnswers));

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewStateImplCopyWith<_$ReviewStateImpl> get copyWith =>
      __$$ReviewStateImplCopyWithImpl<_$ReviewStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewStateImplToJson(
      this,
    );
  }
}

abstract class _ReviewState extends ReviewState {
  const factory _ReviewState(
          {final String? submissionError,
          final bool isSubmitting,
          final bool isSessionEnded,
          final bool hasReviewError,
          final bool isHintVisible,
          final bool isAnswerVisible,
          final int currentCardIndex,
          required final List<Flashcard> flashcards,
          required final List<FlashcardSessionAnswer> sessionAnswers}) =
      _$ReviewStateImpl;
  const _ReviewState._() : super._();

  factory _ReviewState.fromJson(Map<String, dynamic> json) =
      _$ReviewStateImpl.fromJson;

  @override
  String? get submissionError;
  @override
  bool get isSubmitting;
  @override
  bool get isSessionEnded; //
  @override
  bool get hasReviewError;
  @override
  bool get isHintVisible;
  @override
  bool get isAnswerVisible;
  @override
  int get currentCardIndex;
  @override
  List<Flashcard> get flashcards;
  @override
  List<FlashcardSessionAnswer> get sessionAnswers;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewStateImplCopyWith<_$ReviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
