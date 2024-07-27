// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FlashcardAnswer _$FlashcardAnswerFromJson(Map<String, dynamic> json) {
  return _FlashcardAnswer.fromJson(json);
}

/// @nodoc
mixin _$FlashcardAnswer {
  String get id => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  DateTime? get lastUsedAt => throw _privateConstructorUsedError;

  /// Serializes this FlashcardAnswer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FlashcardAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlashcardAnswerCopyWith<FlashcardAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardAnswerCopyWith<$Res> {
  factory $FlashcardAnswerCopyWith(
          FlashcardAnswer value, $Res Function(FlashcardAnswer) then) =
      _$FlashcardAnswerCopyWithImpl<$Res, FlashcardAnswer>;
  @useResult
  $Res call({String id, String answer, DateTime? lastUsedAt});
}

/// @nodoc
class _$FlashcardAnswerCopyWithImpl<$Res, $Val extends FlashcardAnswer>
    implements $FlashcardAnswerCopyWith<$Res> {
  _$FlashcardAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FlashcardAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? lastUsedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      lastUsedAt: freezed == lastUsedAt
          ? _value.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlashcardAnswerImplCopyWith<$Res>
    implements $FlashcardAnswerCopyWith<$Res> {
  factory _$$FlashcardAnswerImplCopyWith(_$FlashcardAnswerImpl value,
          $Res Function(_$FlashcardAnswerImpl) then) =
      __$$FlashcardAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String answer, DateTime? lastUsedAt});
}

/// @nodoc
class __$$FlashcardAnswerImplCopyWithImpl<$Res>
    extends _$FlashcardAnswerCopyWithImpl<$Res, _$FlashcardAnswerImpl>
    implements _$$FlashcardAnswerImplCopyWith<$Res> {
  __$$FlashcardAnswerImplCopyWithImpl(
      _$FlashcardAnswerImpl _value, $Res Function(_$FlashcardAnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of FlashcardAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? answer = null,
    Object? lastUsedAt = freezed,
  }) {
    return _then(_$FlashcardAnswerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      lastUsedAt: freezed == lastUsedAt
          ? _value.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlashcardAnswerImpl implements _FlashcardAnswer {
  const _$FlashcardAnswerImpl(
      {required this.id, required this.answer, this.lastUsedAt});

  factory _$FlashcardAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlashcardAnswerImplFromJson(json);

  @override
  final String id;
  @override
  final String answer;
  @override
  final DateTime? lastUsedAt;

  @override
  String toString() {
    return 'FlashcardAnswer(id: $id, answer: $answer, lastUsedAt: $lastUsedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlashcardAnswerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.lastUsedAt, lastUsedAt) ||
                other.lastUsedAt == lastUsedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, answer, lastUsedAt);

  /// Create a copy of FlashcardAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlashcardAnswerImplCopyWith<_$FlashcardAnswerImpl> get copyWith =>
      __$$FlashcardAnswerImplCopyWithImpl<_$FlashcardAnswerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlashcardAnswerImplToJson(
      this,
    );
  }
}

abstract class _FlashcardAnswer implements FlashcardAnswer {
  const factory _FlashcardAnswer(
      {required final String id,
      required final String answer,
      final DateTime? lastUsedAt}) = _$FlashcardAnswerImpl;

  factory _FlashcardAnswer.fromJson(Map<String, dynamic> json) =
      _$FlashcardAnswerImpl.fromJson;

  @override
  String get id;
  @override
  String get answer;
  @override
  DateTime? get lastUsedAt;

  /// Create a copy of FlashcardAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlashcardAnswerImplCopyWith<_$FlashcardAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
