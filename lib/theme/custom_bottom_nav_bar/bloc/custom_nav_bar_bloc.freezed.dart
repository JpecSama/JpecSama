// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_nav_bar_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomNavBarEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String routeName) navigate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String routeName)? navigate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String routeName)? navigate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Navigate value) navigate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Navigate value)? navigate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Navigate value)? navigate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomNavBarEventCopyWith<$Res> {
  factory $CustomNavBarEventCopyWith(
          CustomNavBarEvent value, $Res Function(CustomNavBarEvent) then) =
      _$CustomNavBarEventCopyWithImpl<$Res, CustomNavBarEvent>;
}

/// @nodoc
class _$CustomNavBarEventCopyWithImpl<$Res, $Val extends CustomNavBarEvent>
    implements $CustomNavBarEventCopyWith<$Res> {
  _$CustomNavBarEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomNavBarEvent
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
    extends _$CustomNavBarEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomNavBarEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'CustomNavBarEvent.started()';
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
    required TResult Function(String routeName) navigate,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String routeName)? navigate,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String routeName)? navigate,
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
    required TResult Function(_Navigate value) navigate,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Navigate value)? navigate,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Navigate value)? navigate,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CustomNavBarEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$NavigateImplCopyWith<$Res> {
  factory _$$NavigateImplCopyWith(
          _$NavigateImpl value, $Res Function(_$NavigateImpl) then) =
      __$$NavigateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String routeName});
}

/// @nodoc
class __$$NavigateImplCopyWithImpl<$Res>
    extends _$CustomNavBarEventCopyWithImpl<$Res, _$NavigateImpl>
    implements _$$NavigateImplCopyWith<$Res> {
  __$$NavigateImplCopyWithImpl(
      _$NavigateImpl _value, $Res Function(_$NavigateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomNavBarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeName = null,
  }) {
    return _then(_$NavigateImpl(
      routeName: null == routeName
          ? _value.routeName
          : routeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NavigateImpl implements _Navigate {
  const _$NavigateImpl({required this.routeName});

  @override
  final String routeName;

  @override
  String toString() {
    return 'CustomNavBarEvent.navigate(routeName: $routeName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigateImpl &&
            (identical(other.routeName, routeName) ||
                other.routeName == routeName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, routeName);

  /// Create a copy of CustomNavBarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigateImplCopyWith<_$NavigateImpl> get copyWith =>
      __$$NavigateImplCopyWithImpl<_$NavigateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String routeName) navigate,
  }) {
    return navigate(routeName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String routeName)? navigate,
  }) {
    return navigate?.call(routeName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String routeName)? navigate,
    required TResult orElse(),
  }) {
    if (navigate != null) {
      return navigate(routeName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Navigate value) navigate,
  }) {
    return navigate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Navigate value)? navigate,
  }) {
    return navigate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Navigate value)? navigate,
    required TResult orElse(),
  }) {
    if (navigate != null) {
      return navigate(this);
    }
    return orElse();
  }
}

abstract class _Navigate implements CustomNavBarEvent {
  const factory _Navigate({required final String routeName}) = _$NavigateImpl;

  String get routeName;

  /// Create a copy of CustomNavBarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NavigateImplCopyWith<_$NavigateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CustomNavBarState {
  String get currentRoute => throw _privateConstructorUsedError;

  /// Create a copy of CustomNavBarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomNavBarStateCopyWith<CustomNavBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomNavBarStateCopyWith<$Res> {
  factory $CustomNavBarStateCopyWith(
          CustomNavBarState value, $Res Function(CustomNavBarState) then) =
      _$CustomNavBarStateCopyWithImpl<$Res, CustomNavBarState>;
  @useResult
  $Res call({String currentRoute});
}

/// @nodoc
class _$CustomNavBarStateCopyWithImpl<$Res, $Val extends CustomNavBarState>
    implements $CustomNavBarStateCopyWith<$Res> {
  _$CustomNavBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomNavBarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentRoute = null,
  }) {
    return _then(_value.copyWith(
      currentRoute: null == currentRoute
          ? _value.currentRoute
          : currentRoute // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomNavBarStateImplCopyWith<$Res>
    implements $CustomNavBarStateCopyWith<$Res> {
  factory _$$CustomNavBarStateImplCopyWith(_$CustomNavBarStateImpl value,
          $Res Function(_$CustomNavBarStateImpl) then) =
      __$$CustomNavBarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currentRoute});
}

/// @nodoc
class __$$CustomNavBarStateImplCopyWithImpl<$Res>
    extends _$CustomNavBarStateCopyWithImpl<$Res, _$CustomNavBarStateImpl>
    implements _$$CustomNavBarStateImplCopyWith<$Res> {
  __$$CustomNavBarStateImplCopyWithImpl(_$CustomNavBarStateImpl _value,
      $Res Function(_$CustomNavBarStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomNavBarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentRoute = null,
  }) {
    return _then(_$CustomNavBarStateImpl(
      currentRoute: null == currentRoute
          ? _value.currentRoute
          : currentRoute // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CustomNavBarStateImpl implements _CustomNavBarState {
  const _$CustomNavBarStateImpl({required this.currentRoute});

  @override
  final String currentRoute;

  @override
  String toString() {
    return 'CustomNavBarState(currentRoute: $currentRoute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomNavBarStateImpl &&
            (identical(other.currentRoute, currentRoute) ||
                other.currentRoute == currentRoute));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentRoute);

  /// Create a copy of CustomNavBarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomNavBarStateImplCopyWith<_$CustomNavBarStateImpl> get copyWith =>
      __$$CustomNavBarStateImplCopyWithImpl<_$CustomNavBarStateImpl>(
          this, _$identity);
}

abstract class _CustomNavBarState implements CustomNavBarState {
  const factory _CustomNavBarState({required final String currentRoute}) =
      _$CustomNavBarStateImpl;

  @override
  String get currentRoute;

  /// Create a copy of CustomNavBarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomNavBarStateImplCopyWith<_$CustomNavBarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
