// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deepl_translation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeeplTranslation _$DeeplTranslationFromJson(Map<String, dynamic> json) {
  return _DeeplTranslation.fromJson(json);
}

/// @nodoc
mixin _$DeeplTranslation {
  String get text => throw _privateConstructorUsedError;
  String? get detectedSourceLanguage => throw _privateConstructorUsedError;

  /// Serializes this DeeplTranslation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeplTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeplTranslationCopyWith<DeeplTranslation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeplTranslationCopyWith<$Res> {
  factory $DeeplTranslationCopyWith(
          DeeplTranslation value, $Res Function(DeeplTranslation) then) =
      _$DeeplTranslationCopyWithImpl<$Res, DeeplTranslation>;
  @useResult
  $Res call({String text, String? detectedSourceLanguage});
}

/// @nodoc
class _$DeeplTranslationCopyWithImpl<$Res, $Val extends DeeplTranslation>
    implements $DeeplTranslationCopyWith<$Res> {
  _$DeeplTranslationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeplTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? detectedSourceLanguage = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      detectedSourceLanguage: freezed == detectedSourceLanguage
          ? _value.detectedSourceLanguage
          : detectedSourceLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeplTranslationImplCopyWith<$Res>
    implements $DeeplTranslationCopyWith<$Res> {
  factory _$$DeeplTranslationImplCopyWith(_$DeeplTranslationImpl value,
          $Res Function(_$DeeplTranslationImpl) then) =
      __$$DeeplTranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, String? detectedSourceLanguage});
}

/// @nodoc
class __$$DeeplTranslationImplCopyWithImpl<$Res>
    extends _$DeeplTranslationCopyWithImpl<$Res, _$DeeplTranslationImpl>
    implements _$$DeeplTranslationImplCopyWith<$Res> {
  __$$DeeplTranslationImplCopyWithImpl(_$DeeplTranslationImpl _value,
      $Res Function(_$DeeplTranslationImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeplTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? detectedSourceLanguage = freezed,
  }) {
    return _then(_$DeeplTranslationImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      detectedSourceLanguage: freezed == detectedSourceLanguage
          ? _value.detectedSourceLanguage
          : detectedSourceLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeplTranslationImpl implements _DeeplTranslation {
  const _$DeeplTranslationImpl(
      {required this.text, this.detectedSourceLanguage});

  factory _$DeeplTranslationImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeeplTranslationImplFromJson(json);

  @override
  final String text;
  @override
  final String? detectedSourceLanguage;

  @override
  String toString() {
    return 'DeeplTranslation(text: $text, detectedSourceLanguage: $detectedSourceLanguage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeplTranslationImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.detectedSourceLanguage, detectedSourceLanguage) ||
                other.detectedSourceLanguage == detectedSourceLanguage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, detectedSourceLanguage);

  /// Create a copy of DeeplTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeplTranslationImplCopyWith<_$DeeplTranslationImpl> get copyWith =>
      __$$DeeplTranslationImplCopyWithImpl<_$DeeplTranslationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeplTranslationImplToJson(
      this,
    );
  }
}

abstract class _DeeplTranslation implements DeeplTranslation {
  const factory _DeeplTranslation(
      {required final String text,
      final String? detectedSourceLanguage}) = _$DeeplTranslationImpl;

  factory _DeeplTranslation.fromJson(Map<String, dynamic> json) =
      _$DeeplTranslationImpl.fromJson;

  @override
  String get text;
  @override
  String? get detectedSourceLanguage;

  /// Create a copy of DeeplTranslation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeplTranslationImplCopyWith<_$DeeplTranslationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
