// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_translation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiTranslation _$ApiTranslationFromJson(Map<String, dynamic> json) {
  return _ApiTranslation.fromJson(json);
}

/// @nodoc
mixin _$ApiTranslation {
  String get text => throw _privateConstructorUsedError;
  String? get hint => throw _privateConstructorUsedError;

  /// Serializes this ApiTranslation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiTranslationCopyWith<ApiTranslation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiTranslationCopyWith<$Res> {
  factory $ApiTranslationCopyWith(
          ApiTranslation value, $Res Function(ApiTranslation) then) =
      _$ApiTranslationCopyWithImpl<$Res, ApiTranslation>;
  @useResult
  $Res call({String text, String? hint});
}

/// @nodoc
class _$ApiTranslationCopyWithImpl<$Res, $Val extends ApiTranslation>
    implements $ApiTranslationCopyWith<$Res> {
  _$ApiTranslationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? hint = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      hint: freezed == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiTranslationImplCopyWith<$Res>
    implements $ApiTranslationCopyWith<$Res> {
  factory _$$ApiTranslationImplCopyWith(_$ApiTranslationImpl value,
          $Res Function(_$ApiTranslationImpl) then) =
      __$$ApiTranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String? hint});
}

/// @nodoc
class __$$ApiTranslationImplCopyWithImpl<$Res>
    extends _$ApiTranslationCopyWithImpl<$Res, _$ApiTranslationImpl>
    implements _$$ApiTranslationImplCopyWith<$Res> {
  __$$ApiTranslationImplCopyWithImpl(
      _$ApiTranslationImpl _value, $Res Function(_$ApiTranslationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? hint = freezed,
  }) {
    return _then(_$ApiTranslationImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      hint: freezed == hint
          ? _value.hint
          : hint // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiTranslationImpl implements _ApiTranslation {
  const _$ApiTranslationImpl({required this.text, this.hint});

  factory _$ApiTranslationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiTranslationImplFromJson(json);

  @override
  final String text;
  @override
  final String? hint;

  @override
  String toString() {
    return 'ApiTranslation(text: $text, hint: $hint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiTranslationImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.hint, hint) || other.hint == hint));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, hint);

  /// Create a copy of ApiTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiTranslationImplCopyWith<_$ApiTranslationImpl> get copyWith =>
      __$$ApiTranslationImplCopyWithImpl<_$ApiTranslationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiTranslationImplToJson(
      this,
    );
  }
}

abstract class _ApiTranslation implements ApiTranslation {
  const factory _ApiTranslation(
      {required final String text, final String? hint}) = _$ApiTranslationImpl;

  factory _ApiTranslation.fromJson(Map<String, dynamic> json) =
      _$ApiTranslationImpl.fromJson;

  @override
  String get text;
  @override
  String? get hint;

  /// Create a copy of ApiTranslation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiTranslationImplCopyWith<_$ApiTranslationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
