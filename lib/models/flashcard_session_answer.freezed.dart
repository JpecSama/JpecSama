// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard_session_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FlashcardSessionAnswer _$FlashcardSessionAnswerFromJson(
    Map<String, dynamic> json) {
  return _FlashcardSessionAnswer.fromJson(json);
}

/// @nodoc
mixin _$FlashcardSessionAnswer {
  String get givenAnswer => throw _privateConstructorUsedError;
  Flashcard get flashCard => throw _privateConstructorUsedError;
  FlashcardAnswer? get flashCardAnswer => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;

  /// Serializes this FlashcardSessionAnswer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlashcardSessionAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlashcardSessionAnswerCopyWith<FlashcardSessionAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardSessionAnswerCopyWith<$Res> {
  factory $FlashcardSessionAnswerCopyWith(FlashcardSessionAnswer value,
          $Res Function(FlashcardSessionAnswer) then) =
      _$FlashcardSessionAnswerCopyWithImpl<$Res, FlashcardSessionAnswer>;
  @useResult
  $Res call(
      {String givenAnswer,
      Flashcard flashCard,
      FlashcardAnswer? flashCardAnswer,
      bool isCorrect});

  $FlashcardCopyWith<$Res> get flashCard;
  $FlashcardAnswerCopyWith<$Res>? get flashCardAnswer;
}

/// @nodoc
class _$FlashcardSessionAnswerCopyWithImpl<$Res,
        $Val extends FlashcardSessionAnswer>
    implements $FlashcardSessionAnswerCopyWith<$Res> {
  _$FlashcardSessionAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlashcardSessionAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? givenAnswer = null,
    Object? flashCard = null,
    Object? flashCardAnswer = freezed,
    Object? isCorrect = null,
  }) {
    return _then(_value.copyWith(
      givenAnswer: null == givenAnswer
          ? _value.givenAnswer
          : givenAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      flashCard: null == flashCard
          ? _value.flashCard
          : flashCard // ignore: cast_nullable_to_non_nullable
              as Flashcard,
      flashCardAnswer: freezed == flashCardAnswer
          ? _value.flashCardAnswer
          : flashCardAnswer // ignore: cast_nullable_to_non_nullable
              as FlashcardAnswer?,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of FlashcardSessionAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlashcardCopyWith<$Res> get flashCard {
    return $FlashcardCopyWith<$Res>(_value.flashCard, (value) {
      return _then(_value.copyWith(flashCard: value) as $Val);
    });
  }

  /// Create a copy of FlashcardSessionAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlashcardAnswerCopyWith<$Res>? get flashCardAnswer {
    if (_value.flashCardAnswer == null) {
      return null;
    }

    return $FlashcardAnswerCopyWith<$Res>(_value.flashCardAnswer!, (value) {
      return _then(_value.copyWith(flashCardAnswer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FlashcardSessionAnswerImplCopyWith<$Res>
    implements $FlashcardSessionAnswerCopyWith<$Res> {
  factory _$$FlashcardSessionAnswerImplCopyWith(
          _$FlashcardSessionAnswerImpl value,
          $Res Function(_$FlashcardSessionAnswerImpl) then) =
      __$$FlashcardSessionAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String givenAnswer,
      Flashcard flashCard,
      FlashcardAnswer? flashCardAnswer,
      bool isCorrect});

  @override
  $FlashcardCopyWith<$Res> get flashCard;
  @override
  $FlashcardAnswerCopyWith<$Res>? get flashCardAnswer;
}

/// @nodoc
class __$$FlashcardSessionAnswerImplCopyWithImpl<$Res>
    extends _$FlashcardSessionAnswerCopyWithImpl<$Res,
        _$FlashcardSessionAnswerImpl>
    implements _$$FlashcardSessionAnswerImplCopyWith<$Res> {
  __$$FlashcardSessionAnswerImplCopyWithImpl(
      _$FlashcardSessionAnswerImpl _value,
      $Res Function(_$FlashcardSessionAnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlashcardSessionAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? givenAnswer = null,
    Object? flashCard = null,
    Object? flashCardAnswer = freezed,
    Object? isCorrect = null,
  }) {
    return _then(_$FlashcardSessionAnswerImpl(
      givenAnswer: null == givenAnswer
          ? _value.givenAnswer
          : givenAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      flashCard: null == flashCard
          ? _value.flashCard
          : flashCard // ignore: cast_nullable_to_non_nullable
              as Flashcard,
      flashCardAnswer: freezed == flashCardAnswer
          ? _value.flashCardAnswer
          : flashCardAnswer // ignore: cast_nullable_to_non_nullable
              as FlashcardAnswer?,
      isCorrect: null == isCorrect
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlashcardSessionAnswerImpl implements _FlashcardSessionAnswer {
  const _$FlashcardSessionAnswerImpl(
      {required this.givenAnswer,
      required this.flashCard,
      this.flashCardAnswer,
      required this.isCorrect});

  factory _$FlashcardSessionAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlashcardSessionAnswerImplFromJson(json);

  @override
  final String givenAnswer;
  @override
  final Flashcard flashCard;
  @override
  final FlashcardAnswer? flashCardAnswer;
  @override
  final bool isCorrect;

  @override
  String toString() {
    return 'FlashcardSessionAnswer(givenAnswer: $givenAnswer, flashCard: $flashCard, flashCardAnswer: $flashCardAnswer, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlashcardSessionAnswerImpl &&
            (identical(other.givenAnswer, givenAnswer) ||
                other.givenAnswer == givenAnswer) &&
            (identical(other.flashCard, flashCard) ||
                other.flashCard == flashCard) &&
            (identical(other.flashCardAnswer, flashCardAnswer) ||
                other.flashCardAnswer == flashCardAnswer) &&
            (identical(other.isCorrect, isCorrect) ||
                other.isCorrect == isCorrect));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, givenAnswer, flashCard, flashCardAnswer, isCorrect);

  /// Create a copy of FlashcardSessionAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlashcardSessionAnswerImplCopyWith<_$FlashcardSessionAnswerImpl>
      get copyWith => __$$FlashcardSessionAnswerImplCopyWithImpl<
          _$FlashcardSessionAnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlashcardSessionAnswerImplToJson(
      this,
    );
  }
}

abstract class _FlashcardSessionAnswer implements FlashcardSessionAnswer {
  const factory _FlashcardSessionAnswer(
      {required final String givenAnswer,
      required final Flashcard flashCard,
      final FlashcardAnswer? flashCardAnswer,
      required final bool isCorrect}) = _$FlashcardSessionAnswerImpl;

  factory _FlashcardSessionAnswer.fromJson(Map<String, dynamic> json) =
      _$FlashcardSessionAnswerImpl.fromJson;

  @override
  String get givenAnswer;
  @override
  Flashcard get flashCard;
  @override
  FlashcardAnswer? get flashCardAnswer;
  @override
  bool get isCorrect;

  /// Create a copy of FlashcardSessionAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlashcardSessionAnswerImplCopyWith<_$FlashcardSessionAnswerImpl>
      get copyWith => throw _privateConstructorUsedError;
}
