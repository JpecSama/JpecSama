// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jisho_translation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JishoTranslation _$JishoTranslationFromJson(Map<String, dynamic> json) {
  return _JishoTranslation.fromJson(json);
}

/// @nodoc
mixin _$JishoTranslation {
  String get slug => throw _privateConstructorUsedError;
  bool get isCommon => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  List<String>? get jlpt => throw _privateConstructorUsedError;
  List<JishoJapanese>? get japanese => throw _privateConstructorUsedError;
  List<JishoSense> get senses => throw _privateConstructorUsedError;

  /// Serializes this JishoTranslation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JishoTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JishoTranslationCopyWith<JishoTranslation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JishoTranslationCopyWith<$Res> {
  factory $JishoTranslationCopyWith(
          JishoTranslation value, $Res Function(JishoTranslation) then) =
      _$JishoTranslationCopyWithImpl<$Res, JishoTranslation>;
  @useResult
  $Res call(
      {String slug,
      bool isCommon,
      List<String>? tags,
      List<String>? jlpt,
      List<JishoJapanese>? japanese,
      List<JishoSense> senses});
}

/// @nodoc
class _$JishoTranslationCopyWithImpl<$Res, $Val extends JishoTranslation>
    implements $JishoTranslationCopyWith<$Res> {
  _$JishoTranslationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JishoTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
    Object? isCommon = null,
    Object? tags = freezed,
    Object? jlpt = freezed,
    Object? japanese = freezed,
    Object? senses = null,
  }) {
    return _then(_value.copyWith(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      isCommon: null == isCommon
          ? _value.isCommon
          : isCommon // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      jlpt: freezed == jlpt
          ? _value.jlpt
          : jlpt // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      japanese: freezed == japanese
          ? _value.japanese
          : japanese // ignore: cast_nullable_to_non_nullable
              as List<JishoJapanese>?,
      senses: null == senses
          ? _value.senses
          : senses // ignore: cast_nullable_to_non_nullable
              as List<JishoSense>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JishoTranslationImplCopyWith<$Res>
    implements $JishoTranslationCopyWith<$Res> {
  factory _$$JishoTranslationImplCopyWith(_$JishoTranslationImpl value,
          $Res Function(_$JishoTranslationImpl) then) =
      __$$JishoTranslationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String slug,
      bool isCommon,
      List<String>? tags,
      List<String>? jlpt,
      List<JishoJapanese>? japanese,
      List<JishoSense> senses});
}

/// @nodoc
class __$$JishoTranslationImplCopyWithImpl<$Res>
    extends _$JishoTranslationCopyWithImpl<$Res, _$JishoTranslationImpl>
    implements _$$JishoTranslationImplCopyWith<$Res> {
  __$$JishoTranslationImplCopyWithImpl(_$JishoTranslationImpl _value,
      $Res Function(_$JishoTranslationImpl) _then)
      : super(_value, _then);

  /// Create a copy of JishoTranslation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
    Object? isCommon = null,
    Object? tags = freezed,
    Object? jlpt = freezed,
    Object? japanese = freezed,
    Object? senses = null,
  }) {
    return _then(_$JishoTranslationImpl(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      isCommon: null == isCommon
          ? _value.isCommon
          : isCommon // ignore: cast_nullable_to_non_nullable
              as bool,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      jlpt: freezed == jlpt
          ? _value._jlpt
          : jlpt // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      japanese: freezed == japanese
          ? _value._japanese
          : japanese // ignore: cast_nullable_to_non_nullable
              as List<JishoJapanese>?,
      senses: null == senses
          ? _value._senses
          : senses // ignore: cast_nullable_to_non_nullable
              as List<JishoSense>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JishoTranslationImpl implements _JishoTranslation {
  const _$JishoTranslationImpl(
      {required this.slug,
      required this.isCommon,
      final List<String>? tags,
      final List<String>? jlpt,
      final List<JishoJapanese>? japanese,
      required final List<JishoSense> senses})
      : _tags = tags,
        _jlpt = jlpt,
        _japanese = japanese,
        _senses = senses;

  factory _$JishoTranslationImpl.fromJson(Map<String, dynamic> json) =>
      _$$JishoTranslationImplFromJson(json);

  @override
  final String slug;
  @override
  final bool isCommon;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _jlpt;
  @override
  List<String>? get jlpt {
    final value = _jlpt;
    if (value == null) return null;
    if (_jlpt is EqualUnmodifiableListView) return _jlpt;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<JishoJapanese>? _japanese;
  @override
  List<JishoJapanese>? get japanese {
    final value = _japanese;
    if (value == null) return null;
    if (_japanese is EqualUnmodifiableListView) return _japanese;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<JishoSense> _senses;
  @override
  List<JishoSense> get senses {
    if (_senses is EqualUnmodifiableListView) return _senses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_senses);
  }

  @override
  String toString() {
    return 'JishoTranslation(slug: $slug, isCommon: $isCommon, tags: $tags, jlpt: $jlpt, japanese: $japanese, senses: $senses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JishoTranslationImpl &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.isCommon, isCommon) ||
                other.isCommon == isCommon) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._jlpt, _jlpt) &&
            const DeepCollectionEquality().equals(other._japanese, _japanese) &&
            const DeepCollectionEquality().equals(other._senses, _senses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      slug,
      isCommon,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_jlpt),
      const DeepCollectionEquality().hash(_japanese),
      const DeepCollectionEquality().hash(_senses));

  /// Create a copy of JishoTranslation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JishoTranslationImplCopyWith<_$JishoTranslationImpl> get copyWith =>
      __$$JishoTranslationImplCopyWithImpl<_$JishoTranslationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JishoTranslationImplToJson(
      this,
    );
  }
}

abstract class _JishoTranslation implements JishoTranslation {
  const factory _JishoTranslation(
      {required final String slug,
      required final bool isCommon,
      final List<String>? tags,
      final List<String>? jlpt,
      final List<JishoJapanese>? japanese,
      required final List<JishoSense> senses}) = _$JishoTranslationImpl;

  factory _JishoTranslation.fromJson(Map<String, dynamic> json) =
      _$JishoTranslationImpl.fromJson;

  @override
  String get slug;
  @override
  bool get isCommon;
  @override
  List<String>? get tags;
  @override
  List<String>? get jlpt;
  @override
  List<JishoJapanese>? get japanese;
  @override
  List<JishoSense> get senses;

  /// Create a copy of JishoTranslation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JishoTranslationImplCopyWith<_$JishoTranslationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
