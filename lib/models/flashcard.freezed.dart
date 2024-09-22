// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flashcard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Flashcard _$FlashcardFromJson(Map<String, dynamic> json) {
  return _Flashcard.fromJson(json);
}

/// @nodoc
mixin _$Flashcard {
  String? get id => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime get nextAvailableAt => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get flashcardText => throw _privateConstructorUsedError;
  String? get hint => throw _privateConstructorUsedError;
  String? get answerInfos => throw _privateConstructorUsedError;
  String? get sourceLanguage => throw _privateConstructorUsedError;
  String? get destLanguage => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError; //dynamic
  @JsonKey(includeFromJson: false)
  bool get isReviewDone => throw _privateConstructorUsedError;
  List<FlashcardAnswer> get flashcardAnswer =>
      throw _privateConstructorUsedError;

  /// Serializes this Flashcard to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Flashcard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FlashcardCopyWith<Flashcard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlashcardCopyWith<$Res> {
  factory $FlashcardCopyWith(Flashcard value, $Res Function(Flashcard) then) =
      _$FlashcardCopyWithImpl<$Res, Flashcard>;
  @useResult
  $Res call(
      {String? id,
      int level,
      DateTime? createdAt,
      DateTime nextAvailableAt,
      String type,
      String flashcardText,
      String? hint,
      String? answerInfos,
      String? sourceLanguage,
      String? destLanguage,
      String? userId,
      @JsonKey(includeFromJson: false) bool isReviewDone,
      List<FlashcardAnswer> flashcardAnswer});
}

/// @nodoc
class _$FlashcardCopyWithImpl<$Res, $Val extends Flashcard>
    implements $FlashcardCopyWith<$Res> {
  _$FlashcardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Flashcard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? level = null,
    Object? createdAt = freezed,
    Object? nextAvailableAt = null,
    Object? type = null,
    Object? flashcardText = null,
    Object? hint = freezed,
    Object? answerInfos = freezed,
    Object? sourceLanguage = freezed,
    Object? destLanguage = freezed,
    Object? userId = freezed,
    Object? isReviewDone = null,
    Object? flashcardAnswer = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextAvailableAt: null == nextAvailableAt
          ? _value.nextAvailableAt
          : nextAvailableAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      flashcardText: null == flashcardText
          ? _value.flashcardText
          : flashcardText // ignore: cast_nullable_to_non_nullable
              as String,
      hint: freezed == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
      answerInfos: freezed == answerInfos
          ? _value.answerInfos
          : answerInfos // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceLanguage: freezed == sourceLanguage
          ? _value.sourceLanguage
          : sourceLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      destLanguage: freezed == destLanguage
          ? _value.destLanguage
          : destLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      isReviewDone: null == isReviewDone
          ? _value.isReviewDone
          : isReviewDone // ignore: cast_nullable_to_non_nullable
              as bool,
      flashcardAnswer: null == flashcardAnswer
          ? _value.flashcardAnswer
          : flashcardAnswer // ignore: cast_nullable_to_non_nullable
              as List<FlashcardAnswer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlashcardImplCopyWith<$Res>
    implements $FlashcardCopyWith<$Res> {
  factory _$$FlashcardImplCopyWith(
          _$FlashcardImpl value, $Res Function(_$FlashcardImpl) then) =
      __$$FlashcardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      int level,
      DateTime? createdAt,
      DateTime nextAvailableAt,
      String type,
      String flashcardText,
      String? hint,
      String? answerInfos,
      String? sourceLanguage,
      String? destLanguage,
      String? userId,
      @JsonKey(includeFromJson: false) bool isReviewDone,
      List<FlashcardAnswer> flashcardAnswer});
}

/// @nodoc
class __$$FlashcardImplCopyWithImpl<$Res>
    extends _$FlashcardCopyWithImpl<$Res, _$FlashcardImpl>
    implements _$$FlashcardImplCopyWith<$Res> {
  __$$FlashcardImplCopyWithImpl(
      _$FlashcardImpl _value, $Res Function(_$FlashcardImpl) _then)
      : super(_value, _then);

  /// Create a copy of Flashcard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? level = null,
    Object? createdAt = freezed,
    Object? nextAvailableAt = null,
    Object? type = null,
    Object? flashcardText = null,
    Object? hint = freezed,
    Object? answerInfos = freezed,
    Object? sourceLanguage = freezed,
    Object? destLanguage = freezed,
    Object? userId = freezed,
    Object? isReviewDone = null,
    Object? flashcardAnswer = null,
  }) {
    return _then(_$FlashcardImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      nextAvailableAt: null == nextAvailableAt
          ? _value.nextAvailableAt
          : nextAvailableAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      flashcardText: null == flashcardText
          ? _value.flashcardText
          : flashcardText // ignore: cast_nullable_to_non_nullable
              as String,
      hint: freezed == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
      answerInfos: freezed == answerInfos
          ? _value.answerInfos
          : answerInfos // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceLanguage: freezed == sourceLanguage
          ? _value.sourceLanguage
          : sourceLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      destLanguage: freezed == destLanguage
          ? _value.destLanguage
          : destLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      isReviewDone: null == isReviewDone
          ? _value.isReviewDone
          : isReviewDone // ignore: cast_nullable_to_non_nullable
              as bool,
      flashcardAnswer: null == flashcardAnswer
          ? _value._flashcardAnswer
          : flashcardAnswer // ignore: cast_nullable_to_non_nullable
              as List<FlashcardAnswer>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlashcardImpl extends _Flashcard {
  const _$FlashcardImpl(
      {this.id,
      this.level = 0,
      this.createdAt,
      required this.nextAvailableAt,
      this.type = 'vocabulary',
      required this.flashcardText,
      this.hint,
      this.answerInfos,
      this.sourceLanguage,
      this.destLanguage,
      this.userId,
      @JsonKey(includeFromJson: false) this.isReviewDone = false,
      final List<FlashcardAnswer> flashcardAnswer = const []})
      : _flashcardAnswer = flashcardAnswer,
        super._();

  factory _$FlashcardImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlashcardImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey()
  final int level;
  @override
  final DateTime? createdAt;
  @override
  final DateTime nextAvailableAt;
  @override
  @JsonKey()
  final String type;
  @override
  final String flashcardText;
  @override
  final String? hint;
  @override
  final String? answerInfos;
  @override
  final String? sourceLanguage;
  @override
  final String? destLanguage;
  @override
  final String? userId;
//dynamic
  @override
  @JsonKey(includeFromJson: false)
  final bool isReviewDone;
  final List<FlashcardAnswer> _flashcardAnswer;
  @override
  @JsonKey()
  List<FlashcardAnswer> get flashcardAnswer {
    if (_flashcardAnswer is EqualUnmodifiableListView) return _flashcardAnswer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flashcardAnswer);
  }

  @override
  String toString() {
    return 'Flashcard(id: $id, level: $level, createdAt: $createdAt, nextAvailableAt: $nextAvailableAt, type: $type, flashcardText: $flashcardText, hint: $hint, answerInfos: $answerInfos, sourceLanguage: $sourceLanguage, destLanguage: $destLanguage, userId: $userId, isReviewDone: $isReviewDone, flashcardAnswer: $flashcardAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlashcardImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.nextAvailableAt, nextAvailableAt) ||
                other.nextAvailableAt == nextAvailableAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.flashcardText, flashcardText) ||
                other.flashcardText == flashcardText) &&
            (identical(other.hint, hint) || other.hint == hint) &&
            (identical(other.answerInfos, answerInfos) ||
                other.answerInfos == answerInfos) &&
            (identical(other.sourceLanguage, sourceLanguage) ||
                other.sourceLanguage == sourceLanguage) &&
            (identical(other.destLanguage, destLanguage) ||
                other.destLanguage == destLanguage) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isReviewDone, isReviewDone) ||
                other.isReviewDone == isReviewDone) &&
            const DeepCollectionEquality()
                .equals(other._flashcardAnswer, _flashcardAnswer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      level,
      createdAt,
      nextAvailableAt,
      type,
      flashcardText,
      hint,
      answerInfos,
      sourceLanguage,
      destLanguage,
      userId,
      isReviewDone,
      const DeepCollectionEquality().hash(_flashcardAnswer));

  /// Create a copy of Flashcard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FlashcardImplCopyWith<_$FlashcardImpl> get copyWith =>
      __$$FlashcardImplCopyWithImpl<_$FlashcardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlashcardImplToJson(
      this,
    );
  }
}

abstract class _Flashcard extends Flashcard {
  const factory _Flashcard(
      {final String? id,
      final int level,
      final DateTime? createdAt,
      required final DateTime nextAvailableAt,
      final String type,
      required final String flashcardText,
      final String? hint,
      final String? answerInfos,
      final String? sourceLanguage,
      final String? destLanguage,
      final String? userId,
      @JsonKey(includeFromJson: false) final bool isReviewDone,
      final List<FlashcardAnswer> flashcardAnswer}) = _$FlashcardImpl;
  const _Flashcard._() : super._();

  factory _Flashcard.fromJson(Map<String, dynamic> json) =
      _$FlashcardImpl.fromJson;

  @override
  String? get id;
  @override
  int get level;
  @override
  DateTime? get createdAt;
  @override
  DateTime get nextAvailableAt;
  @override
  String get type;
  @override
  String get flashcardText;
  @override
  String? get hint;
  @override
  String? get answerInfos;
  @override
  String? get sourceLanguage;
  @override
  String? get destLanguage;
  @override
  String? get userId; //dynamic
  @override
  @JsonKey(includeFromJson: false)
  bool get isReviewDone;
  @override
  List<FlashcardAnswer> get flashcardAnswer;

  /// Create a copy of Flashcard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FlashcardImplCopyWith<_$FlashcardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
