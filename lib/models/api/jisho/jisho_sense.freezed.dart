// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jisho_sense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JishoSense _$JishoSenseFromJson(Map<String, dynamic> json) {
  return _JishoSense.fromJson(json);
}

/// @nodoc
mixin _$JishoSense {
  List<String> get englishDefinitions => throw _privateConstructorUsedError;
  List<String>? get partsOfSpeech => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  List<String>? get infos => throw _privateConstructorUsedError;

  /// Serializes this JishoSense to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JishoSense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JishoSenseCopyWith<JishoSense> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JishoSenseCopyWith<$Res> {
  factory $JishoSenseCopyWith(
          JishoSense value, $Res Function(JishoSense) then) =
      _$JishoSenseCopyWithImpl<$Res, JishoSense>;
  @useResult
  $Res call(
      {List<String> englishDefinitions,
      List<String>? partsOfSpeech,
      List<String>? tags,
      List<String>? infos});
}

/// @nodoc
class _$JishoSenseCopyWithImpl<$Res, $Val extends JishoSense>
    implements $JishoSenseCopyWith<$Res> {
  _$JishoSenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JishoSense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? englishDefinitions = null,
    Object? partsOfSpeech = freezed,
    Object? tags = freezed,
    Object? infos = freezed,
  }) {
    return _then(_value.copyWith(
      englishDefinitions: null == englishDefinitions
          ? _value.englishDefinitions
          : englishDefinitions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      partsOfSpeech: freezed == partsOfSpeech
          ? _value.partsOfSpeech
          : partsOfSpeech // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      infos: freezed == infos
          ? _value.infos
          : infos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JishoSenseImplCopyWith<$Res>
    implements $JishoSenseCopyWith<$Res> {
  factory _$$JishoSenseImplCopyWith(
          _$JishoSenseImpl value, $Res Function(_$JishoSenseImpl) then) =
      __$$JishoSenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> englishDefinitions,
      List<String>? partsOfSpeech,
      List<String>? tags,
      List<String>? infos});
}

/// @nodoc
class __$$JishoSenseImplCopyWithImpl<$Res>
    extends _$JishoSenseCopyWithImpl<$Res, _$JishoSenseImpl>
    implements _$$JishoSenseImplCopyWith<$Res> {
  __$$JishoSenseImplCopyWithImpl(
      _$JishoSenseImpl _value, $Res Function(_$JishoSenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of JishoSense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? englishDefinitions = null,
    Object? partsOfSpeech = freezed,
    Object? tags = freezed,
    Object? infos = freezed,
  }) {
    return _then(_$JishoSenseImpl(
      englishDefinitions: null == englishDefinitions
          ? _value._englishDefinitions
          : englishDefinitions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      partsOfSpeech: freezed == partsOfSpeech
          ? _value._partsOfSpeech
          : partsOfSpeech // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      infos: freezed == infos
          ? _value._infos
          : infos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JishoSenseImpl implements _JishoSense {
  const _$JishoSenseImpl(
      {required final List<String> englishDefinitions,
      final List<String>? partsOfSpeech,
      final List<String>? tags,
      final List<String>? infos})
      : _englishDefinitions = englishDefinitions,
        _partsOfSpeech = partsOfSpeech,
        _tags = tags,
        _infos = infos;

  factory _$JishoSenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$JishoSenseImplFromJson(json);

  final List<String> _englishDefinitions;
  @override
  List<String> get englishDefinitions {
    if (_englishDefinitions is EqualUnmodifiableListView)
      return _englishDefinitions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_englishDefinitions);
  }

  final List<String>? _partsOfSpeech;
  @override
  List<String>? get partsOfSpeech {
    final value = _partsOfSpeech;
    if (value == null) return null;
    if (_partsOfSpeech is EqualUnmodifiableListView) return _partsOfSpeech;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _infos;
  @override
  List<String>? get infos {
    final value = _infos;
    if (value == null) return null;
    if (_infos is EqualUnmodifiableListView) return _infos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'JishoSense(englishDefinitions: $englishDefinitions, partsOfSpeech: $partsOfSpeech, tags: $tags, infos: $infos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JishoSenseImpl &&
            const DeepCollectionEquality()
                .equals(other._englishDefinitions, _englishDefinitions) &&
            const DeepCollectionEquality()
                .equals(other._partsOfSpeech, _partsOfSpeech) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._infos, _infos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_englishDefinitions),
      const DeepCollectionEquality().hash(_partsOfSpeech),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_infos));

  /// Create a copy of JishoSense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JishoSenseImplCopyWith<_$JishoSenseImpl> get copyWith =>
      __$$JishoSenseImplCopyWithImpl<_$JishoSenseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JishoSenseImplToJson(
      this,
    );
  }
}

abstract class _JishoSense implements JishoSense {
  const factory _JishoSense(
      {required final List<String> englishDefinitions,
      final List<String>? partsOfSpeech,
      final List<String>? tags,
      final List<String>? infos}) = _$JishoSenseImpl;

  factory _JishoSense.fromJson(Map<String, dynamic> json) =
      _$JishoSenseImpl.fromJson;

  @override
  List<String> get englishDefinitions;
  @override
  List<String>? get partsOfSpeech;
  @override
  List<String>? get tags;
  @override
  List<String>? get infos;

  /// Create a copy of JishoSense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JishoSenseImplCopyWith<_$JishoSenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
