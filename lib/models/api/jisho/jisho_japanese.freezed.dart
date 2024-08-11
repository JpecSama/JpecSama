// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jisho_japanese.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JishoJapanese _$JishoJapaneseFromJson(Map<String, dynamic> json) {
  return _JishoJapanese.fromJson(json);
}

/// @nodoc
mixin _$JishoJapanese {
  String? get word => throw _privateConstructorUsedError;
  String? get reading => throw _privateConstructorUsedError;

  /// Serializes this JishoJapanese to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JishoJapanese
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JishoJapaneseCopyWith<JishoJapanese> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JishoJapaneseCopyWith<$Res> {
  factory $JishoJapaneseCopyWith(
          JishoJapanese value, $Res Function(JishoJapanese) then) =
      _$JishoJapaneseCopyWithImpl<$Res, JishoJapanese>;
  @useResult
  $Res call({String? word, String? reading});
}

/// @nodoc
class _$JishoJapaneseCopyWithImpl<$Res, $Val extends JishoJapanese>
    implements $JishoJapaneseCopyWith<$Res> {
  _$JishoJapaneseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JishoJapanese
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = freezed,
    Object? reading = freezed,
  }) {
    return _then(_value.copyWith(
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      reading: freezed == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JishoJapaneseImplCopyWith<$Res>
    implements $JishoJapaneseCopyWith<$Res> {
  factory _$$JishoJapaneseImplCopyWith(
          _$JishoJapaneseImpl value, $Res Function(_$JishoJapaneseImpl) then) =
      __$$JishoJapaneseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? word, String? reading});
}

/// @nodoc
class __$$JishoJapaneseImplCopyWithImpl<$Res>
    extends _$JishoJapaneseCopyWithImpl<$Res, _$JishoJapaneseImpl>
    implements _$$JishoJapaneseImplCopyWith<$Res> {
  __$$JishoJapaneseImplCopyWithImpl(
      _$JishoJapaneseImpl _value, $Res Function(_$JishoJapaneseImpl) _then)
      : super(_value, _then);

  /// Create a copy of JishoJapanese
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = freezed,
    Object? reading = freezed,
  }) {
    return _then(_$JishoJapaneseImpl(
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      reading: freezed == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JishoJapaneseImpl implements _JishoJapanese {
  const _$JishoJapaneseImpl({this.word, this.reading});

  factory _$JishoJapaneseImpl.fromJson(Map<String, dynamic> json) =>
      _$$JishoJapaneseImplFromJson(json);

  @override
  final String? word;
  @override
  final String? reading;

  @override
  String toString() {
    return 'JishoJapanese(word: $word, reading: $reading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JishoJapaneseImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.reading, reading) || other.reading == reading));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, word, reading);

  /// Create a copy of JishoJapanese
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JishoJapaneseImplCopyWith<_$JishoJapaneseImpl> get copyWith =>
      __$$JishoJapaneseImplCopyWithImpl<_$JishoJapaneseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JishoJapaneseImplToJson(
      this,
    );
  }
}

abstract class _JishoJapanese implements JishoJapanese {
  const factory _JishoJapanese({final String? word, final String? reading}) =
      _$JishoJapaneseImpl;

  factory _JishoJapanese.fromJson(Map<String, dynamic> json) =
      _$JishoJapaneseImpl.fromJson;

  @override
  String? get word;
  @override
  String? get reading;

  /// Create a copy of JishoJapanese
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JishoJapaneseImplCopyWith<_$JishoJapaneseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
