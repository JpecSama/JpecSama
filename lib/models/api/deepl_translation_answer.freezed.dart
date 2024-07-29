// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deepl_translation_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeeplTranslationAnswer _$DeeplTranslationAnswerFromJson(
    Map<String, dynamic> json) {
  return _DeeplTranslationAnswer.fromJson(json);
}

/// @nodoc
mixin _$DeeplTranslationAnswer {
// @JsonKey(toJson: DeeplTranslation.)
  List<DeeplTranslation> get translations => throw _privateConstructorUsedError;

  /// Serializes this DeeplTranslationAnswer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeplTranslationAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeplTranslationAnswerCopyWith<DeeplTranslationAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeplTranslationAnswerCopyWith<$Res> {
  factory $DeeplTranslationAnswerCopyWith(DeeplTranslationAnswer value,
          $Res Function(DeeplTranslationAnswer) then) =
      _$DeeplTranslationAnswerCopyWithImpl<$Res, DeeplTranslationAnswer>;
  @useResult
  $Res call({List<DeeplTranslation> translations});
}

/// @nodoc
class _$DeeplTranslationAnswerCopyWithImpl<$Res,
        $Val extends DeeplTranslationAnswer>
    implements $DeeplTranslationAnswerCopyWith<$Res> {
  _$DeeplTranslationAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeplTranslationAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? translations = null,
  }) {
    return _then(_value.copyWith(
      translations: null == translations
          ? _value.translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<DeeplTranslation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeplTranslationAnswerImplCopyWith<$Res>
    implements $DeeplTranslationAnswerCopyWith<$Res> {
  factory _$$DeeplTranslationAnswerImplCopyWith(
          _$DeeplTranslationAnswerImpl value,
          $Res Function(_$DeeplTranslationAnswerImpl) then) =
      __$$DeeplTranslationAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DeeplTranslation> translations});
}

/// @nodoc
class __$$DeeplTranslationAnswerImplCopyWithImpl<$Res>
    extends _$DeeplTranslationAnswerCopyWithImpl<$Res,
        _$DeeplTranslationAnswerImpl>
    implements _$$DeeplTranslationAnswerImplCopyWith<$Res> {
  __$$DeeplTranslationAnswerImplCopyWithImpl(
      _$DeeplTranslationAnswerImpl _value,
      $Res Function(_$DeeplTranslationAnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeplTranslationAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? translations = null,
  }) {
    return _then(_$DeeplTranslationAnswerImpl(
      translations: null == translations
          ? _value._translations
          : translations // ignore: cast_nullable_to_non_nullable
              as List<DeeplTranslation>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$DeeplTranslationAnswerImpl extends _DeeplTranslationAnswer {
  const _$DeeplTranslationAnswerImpl(
      {required final List<DeeplTranslation> translations})
      : _translations = translations,
        super._();

  factory _$DeeplTranslationAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeeplTranslationAnswerImplFromJson(json);

// @JsonKey(toJson: DeeplTranslation.)
  final List<DeeplTranslation> _translations;
// @JsonKey(toJson: DeeplTranslation.)
  @override
  List<DeeplTranslation> get translations {
    if (_translations is EqualUnmodifiableListView) return _translations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_translations);
  }

  @override
  String toString() {
    return 'DeeplTranslationAnswer(translations: $translations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeplTranslationAnswerImpl &&
            const DeepCollectionEquality()
                .equals(other._translations, _translations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_translations));

  /// Create a copy of DeeplTranslationAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeplTranslationAnswerImplCopyWith<_$DeeplTranslationAnswerImpl>
      get copyWith => __$$DeeplTranslationAnswerImplCopyWithImpl<
          _$DeeplTranslationAnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeplTranslationAnswerImplToJson(
      this,
    );
  }
}

abstract class _DeeplTranslationAnswer extends DeeplTranslationAnswer {
  const factory _DeeplTranslationAnswer(
          {required final List<DeeplTranslation> translations}) =
      _$DeeplTranslationAnswerImpl;
  const _DeeplTranslationAnswer._() : super._();

  factory _DeeplTranslationAnswer.fromJson(Map<String, dynamic> json) =
      _$DeeplTranslationAnswerImpl.fromJson;

// @JsonKey(toJson: DeeplTranslation.)
  @override
  List<DeeplTranslation> get translations;

  /// Create a copy of DeeplTranslationAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeplTranslationAnswerImplCopyWith<_$DeeplTranslationAnswerImpl>
      get copyWith => throw _privateConstructorUsedError;
}
