// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomThemeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomThemeEventCopyWith<$Res> {
  factory $CustomThemeEventCopyWith(
          CustomThemeEvent value, $Res Function(CustomThemeEvent) then) =
      _$CustomThemeEventCopyWithImpl<$Res, CustomThemeEvent>;
}

/// @nodoc
class _$CustomThemeEventCopyWithImpl<$Res, $Val extends CustomThemeEvent>
    implements $CustomThemeEventCopyWith<$Res> {
  _$CustomThemeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$CustomThemeEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomThemeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CustomThemeEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CustomThemeEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
mixin _$CustomThemeState {
  ThemeData get themeData => throw _privateConstructorUsedError;

  /// Create a copy of CustomThemeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomThemeStateCopyWith<CustomThemeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomThemeStateCopyWith<$Res> {
  factory $CustomThemeStateCopyWith(
          CustomThemeState value, $Res Function(CustomThemeState) then) =
      _$CustomThemeStateCopyWithImpl<$Res, CustomThemeState>;
  @useResult
  $Res call({ThemeData themeData});
}

/// @nodoc
class _$CustomThemeStateCopyWithImpl<$Res, $Val extends CustomThemeState>
    implements $CustomThemeStateCopyWith<$Res> {
  _$CustomThemeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomThemeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeData = null,
  }) {
    return _then(_value.copyWith(
      themeData: null == themeData
          ? _value.themeData
          : themeData // ignore: cast_nullable_to_non_nullable
              as ThemeData,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomThemeStateImplCopyWith<$Res>
    implements $CustomThemeStateCopyWith<$Res> {
  factory _$$CustomThemeStateImplCopyWith(_$CustomThemeStateImpl value,
          $Res Function(_$CustomThemeStateImpl) then) =
      __$$CustomThemeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeData themeData});
}

/// @nodoc
class __$$CustomThemeStateImplCopyWithImpl<$Res>
    extends _$CustomThemeStateCopyWithImpl<$Res, _$CustomThemeStateImpl>
    implements _$$CustomThemeStateImplCopyWith<$Res> {
  __$$CustomThemeStateImplCopyWithImpl(_$CustomThemeStateImpl _value,
      $Res Function(_$CustomThemeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomThemeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? themeData = null,
  }) {
    return _then(_$CustomThemeStateImpl(
      themeData: null == themeData
          ? _value.themeData
          : themeData // ignore: cast_nullable_to_non_nullable
              as ThemeData,
    ));
  }
}

/// @nodoc

class _$CustomThemeStateImpl implements _CustomThemeState {
  const _$CustomThemeStateImpl({required this.themeData});

  @override
  final ThemeData themeData;

  @override
  String toString() {
    return 'CustomThemeState(themeData: $themeData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomThemeStateImpl &&
            (identical(other.themeData, themeData) ||
                other.themeData == themeData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, themeData);

  /// Create a copy of CustomThemeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomThemeStateImplCopyWith<_$CustomThemeStateImpl> get copyWith =>
      __$$CustomThemeStateImplCopyWithImpl<_$CustomThemeStateImpl>(
          this, _$identity);
}

abstract class _CustomThemeState implements CustomThemeState {
  const factory _CustomThemeState({required final ThemeData themeData}) =
      _$CustomThemeStateImpl;

  @override
  ThemeData get themeData;

  /// Create a copy of CustomThemeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomThemeStateImplCopyWith<_$CustomThemeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
