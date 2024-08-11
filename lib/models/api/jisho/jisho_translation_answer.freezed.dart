// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jisho_translation_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JishoTranslationAnswer _$JishoTranslationAnswerFromJson(
    Map<String, dynamic> json) {
  return _JishoTranslationAnswer.fromJson(json);
}

/// @nodoc
mixin _$JishoTranslationAnswer {
  List<JishoTranslation> get data => throw _privateConstructorUsedError;

  /// Serializes this JishoTranslationAnswer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of JishoTranslationAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JishoTranslationAnswerCopyWith<JishoTranslationAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JishoTranslationAnswerCopyWith<$Res> {
  factory $JishoTranslationAnswerCopyWith(JishoTranslationAnswer value,
          $Res Function(JishoTranslationAnswer) then) =
      _$JishoTranslationAnswerCopyWithImpl<$Res, JishoTranslationAnswer>;
  @useResult
  $Res call({List<JishoTranslation> data});
}

/// @nodoc
class _$JishoTranslationAnswerCopyWithImpl<$Res,
        $Val extends JishoTranslationAnswer>
    implements $JishoTranslationAnswerCopyWith<$Res> {
  _$JishoTranslationAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of JishoTranslationAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<JishoTranslation>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JishoTranslationAnswerImplCopyWith<$Res>
    implements $JishoTranslationAnswerCopyWith<$Res> {
  factory _$$JishoTranslationAnswerImplCopyWith(
          _$JishoTranslationAnswerImpl value,
          $Res Function(_$JishoTranslationAnswerImpl) then) =
      __$$JishoTranslationAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<JishoTranslation> data});
}

/// @nodoc
class __$$JishoTranslationAnswerImplCopyWithImpl<$Res>
    extends _$JishoTranslationAnswerCopyWithImpl<$Res,
        _$JishoTranslationAnswerImpl>
    implements _$$JishoTranslationAnswerImplCopyWith<$Res> {
  __$$JishoTranslationAnswerImplCopyWithImpl(
      _$JishoTranslationAnswerImpl _value,
      $Res Function(_$JishoTranslationAnswerImpl) _then)
      : super(_value, _then);

  /// Create a copy of JishoTranslationAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$JishoTranslationAnswerImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<JishoTranslation>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JishoTranslationAnswerImpl implements _JishoTranslationAnswer {
  const _$JishoTranslationAnswerImpl(
      {required final List<JishoTranslation> data})
      : _data = data;

  factory _$JishoTranslationAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$JishoTranslationAnswerImplFromJson(json);

  final List<JishoTranslation> _data;
  @override
  List<JishoTranslation> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'JishoTranslationAnswer(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JishoTranslationAnswerImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of JishoTranslationAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JishoTranslationAnswerImplCopyWith<_$JishoTranslationAnswerImpl>
      get copyWith => __$$JishoTranslationAnswerImplCopyWithImpl<
          _$JishoTranslationAnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JishoTranslationAnswerImplToJson(
      this,
    );
  }
}

abstract class _JishoTranslationAnswer implements JishoTranslationAnswer {
  const factory _JishoTranslationAnswer(
          {required final List<JishoTranslation> data}) =
      _$JishoTranslationAnswerImpl;

  factory _JishoTranslationAnswer.fromJson(Map<String, dynamic> json) =
      _$JishoTranslationAnswerImpl.fromJson;

  @override
  List<JishoTranslation> get data;

  /// Create a copy of JishoTranslationAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JishoTranslationAnswerImplCopyWith<_$JishoTranslationAnswerImpl>
      get copyWith => throw _privateConstructorUsedError;
}
