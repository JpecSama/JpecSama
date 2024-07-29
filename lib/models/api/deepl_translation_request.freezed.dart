// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deepl_translation_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeeplTranslationRequest _$DeeplTranslationRequestFromJson(
    Map<String, dynamic> json) {
  return _DeeplTranslationRequest.fromJson(json);
}

/// @nodoc
mixin _$DeeplTranslationRequest {
  List<String> get text => throw _privateConstructorUsedError;
  String get targetLang => throw _privateConstructorUsedError;
  String? get sourceLang => throw _privateConstructorUsedError;

  /// Serializes this DeeplTranslationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeeplTranslationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeeplTranslationRequestCopyWith<DeeplTranslationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeeplTranslationRequestCopyWith<$Res> {
  factory $DeeplTranslationRequestCopyWith(DeeplTranslationRequest value,
          $Res Function(DeeplTranslationRequest) then) =
      _$DeeplTranslationRequestCopyWithImpl<$Res, DeeplTranslationRequest>;
  @useResult
  $Res call({List<String> text, String targetLang, String? sourceLang});
}

/// @nodoc
class _$DeeplTranslationRequestCopyWithImpl<$Res,
        $Val extends DeeplTranslationRequest>
    implements $DeeplTranslationRequestCopyWith<$Res> {
  _$DeeplTranslationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeeplTranslationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? targetLang = null,
    Object? sourceLang = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetLang: null == targetLang
          ? _value.targetLang
          : targetLang // ignore: cast_nullable_to_non_nullable
              as String,
      sourceLang: freezed == sourceLang
          ? _value.sourceLang
          : sourceLang // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeeplTranslationRequestImplCopyWith<$Res>
    implements $DeeplTranslationRequestCopyWith<$Res> {
  factory _$$DeeplTranslationRequestImplCopyWith(
          _$DeeplTranslationRequestImpl value,
          $Res Function(_$DeeplTranslationRequestImpl) then) =
      __$$DeeplTranslationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> text, String targetLang, String? sourceLang});
}

/// @nodoc
class __$$DeeplTranslationRequestImplCopyWithImpl<$Res>
    extends _$DeeplTranslationRequestCopyWithImpl<$Res,
        _$DeeplTranslationRequestImpl>
    implements _$$DeeplTranslationRequestImplCopyWith<$Res> {
  __$$DeeplTranslationRequestImplCopyWithImpl(
      _$DeeplTranslationRequestImpl _value,
      $Res Function(_$DeeplTranslationRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeeplTranslationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? targetLang = null,
    Object? sourceLang = freezed,
  }) {
    return _then(_$DeeplTranslationRequestImpl(
      text: null == text
          ? _value._text
          : text // ignore: cast_nullable_to_non_nullable
              as List<String>,
      targetLang: null == targetLang
          ? _value.targetLang
          : targetLang // ignore: cast_nullable_to_non_nullable
              as String,
      sourceLang: freezed == sourceLang
          ? _value.sourceLang
          : sourceLang // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeeplTranslationRequestImpl implements _DeeplTranslationRequest {
  const _$DeeplTranslationRequestImpl(
      {required final List<String> text,
      required this.targetLang,
      this.sourceLang})
      : _text = text;

  factory _$DeeplTranslationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeeplTranslationRequestImplFromJson(json);

  final List<String> _text;
  @override
  List<String> get text {
    if (_text is EqualUnmodifiableListView) return _text;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_text);
  }

  @override
  final String targetLang;
  @override
  final String? sourceLang;

  @override
  String toString() {
    return 'DeeplTranslationRequest(text: $text, targetLang: $targetLang, sourceLang: $sourceLang)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeeplTranslationRequestImpl &&
            const DeepCollectionEquality().equals(other._text, _text) &&
            (identical(other.targetLang, targetLang) ||
                other.targetLang == targetLang) &&
            (identical(other.sourceLang, sourceLang) ||
                other.sourceLang == sourceLang));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_text), targetLang, sourceLang);

  /// Create a copy of DeeplTranslationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeeplTranslationRequestImplCopyWith<_$DeeplTranslationRequestImpl>
      get copyWith => __$$DeeplTranslationRequestImplCopyWithImpl<
          _$DeeplTranslationRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeeplTranslationRequestImplToJson(
      this,
    );
  }
}

abstract class _DeeplTranslationRequest implements DeeplTranslationRequest {
  const factory _DeeplTranslationRequest(
      {required final List<String> text,
      required final String targetLang,
      final String? sourceLang}) = _$DeeplTranslationRequestImpl;

  factory _DeeplTranslationRequest.fromJson(Map<String, dynamic> json) =
      _$DeeplTranslationRequestImpl.fromJson;

  @override
  List<String> get text;
  @override
  String get targetLang;
  @override
  String? get sourceLang;

  /// Create a copy of DeeplTranslationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeeplTranslationRequestImplCopyWith<_$DeeplTranslationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
