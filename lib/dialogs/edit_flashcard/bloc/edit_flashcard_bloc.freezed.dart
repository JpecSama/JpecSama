// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_flashcard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditFlashcardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Submitted value) submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Submitted value)? submitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditFlashcardEventCopyWith<$Res> {
  factory $EditFlashcardEventCopyWith(
          EditFlashcardEvent value, $Res Function(EditFlashcardEvent) then) =
      _$EditFlashcardEventCopyWithImpl<$Res, EditFlashcardEvent>;
}

/// @nodoc
class _$EditFlashcardEventCopyWithImpl<$Res, $Val extends EditFlashcardEvent>
    implements $EditFlashcardEventCopyWith<$Res> {
  _$EditFlashcardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditFlashcardEvent
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
    extends _$EditFlashcardEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditFlashcardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'EditFlashcardEvent.started()';
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
    required TResult Function() submitted,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? submitted,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? submitted,
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
    required TResult Function(_Submitted value) submitted,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements EditFlashcardEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SubmittedImplCopyWith<$Res> {
  factory _$$SubmittedImplCopyWith(
          _$SubmittedImpl value, $Res Function(_$SubmittedImpl) then) =
      __$$SubmittedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmittedImplCopyWithImpl<$Res>
    extends _$EditFlashcardEventCopyWithImpl<$Res, _$SubmittedImpl>
    implements _$$SubmittedImplCopyWith<$Res> {
  __$$SubmittedImplCopyWithImpl(
      _$SubmittedImpl _value, $Res Function(_$SubmittedImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditFlashcardEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SubmittedImpl implements _Submitted {
  const _$SubmittedImpl();

  @override
  String toString() {
    return 'EditFlashcardEvent.submitted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmittedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() submitted,
  }) {
    return submitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? submitted,
  }) {
    return submitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Submitted value) submitted,
  }) {
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Submitted value)? submitted,
  }) {
    return submitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Submitted value)? submitted,
    required TResult orElse(),
  }) {
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements EditFlashcardEvent {
  const factory _Submitted() = _$SubmittedImpl;
}

/// @nodoc
mixin _$EditFlashcardState {
  Flashcard get flashcard => throw _privateConstructorUsedError;
  dynamic get isSubmitting => throw _privateConstructorUsedError;

  /// Create a copy of EditFlashcardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EditFlashcardStateCopyWith<EditFlashcardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditFlashcardStateCopyWith<$Res> {
  factory $EditFlashcardStateCopyWith(
          EditFlashcardState value, $Res Function(EditFlashcardState) then) =
      _$EditFlashcardStateCopyWithImpl<$Res, EditFlashcardState>;
  @useResult
  $Res call({Flashcard flashcard, dynamic isSubmitting});

  $FlashcardCopyWith<$Res> get flashcard;
}

/// @nodoc
class _$EditFlashcardStateCopyWithImpl<$Res, $Val extends EditFlashcardState>
    implements $EditFlashcardStateCopyWith<$Res> {
  _$EditFlashcardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EditFlashcardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flashcard = null,
    Object? isSubmitting = freezed,
  }) {
    return _then(_value.copyWith(
      flashcard: null == flashcard
          ? _value.flashcard
          : flashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard,
      isSubmitting: freezed == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  /// Create a copy of EditFlashcardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FlashcardCopyWith<$Res> get flashcard {
    return $FlashcardCopyWith<$Res>(_value.flashcard, (value) {
      return _then(_value.copyWith(flashcard: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditFlashcardStateImplCopyWith<$Res>
    implements $EditFlashcardStateCopyWith<$Res> {
  factory _$$EditFlashcardStateImplCopyWith(_$EditFlashcardStateImpl value,
          $Res Function(_$EditFlashcardStateImpl) then) =
      __$$EditFlashcardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Flashcard flashcard, dynamic isSubmitting});

  @override
  $FlashcardCopyWith<$Res> get flashcard;
}

/// @nodoc
class __$$EditFlashcardStateImplCopyWithImpl<$Res>
    extends _$EditFlashcardStateCopyWithImpl<$Res, _$EditFlashcardStateImpl>
    implements _$$EditFlashcardStateImplCopyWith<$Res> {
  __$$EditFlashcardStateImplCopyWithImpl(_$EditFlashcardStateImpl _value,
      $Res Function(_$EditFlashcardStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EditFlashcardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flashcard = null,
    Object? isSubmitting = freezed,
  }) {
    return _then(_$EditFlashcardStateImpl(
      flashcard: null == flashcard
          ? _value.flashcard
          : flashcard // ignore: cast_nullable_to_non_nullable
              as Flashcard,
      isSubmitting:
          freezed == isSubmitting ? _value.isSubmitting! : isSubmitting,
    ));
  }
}

/// @nodoc

class _$EditFlashcardStateImpl implements _EditFlashcardState {
  const _$EditFlashcardStateImpl(
      {required this.flashcard, this.isSubmitting = false});

  @override
  final Flashcard flashcard;
  @override
  @JsonKey()
  final dynamic isSubmitting;

  @override
  String toString() {
    return 'EditFlashcardState(flashcard: $flashcard, isSubmitting: $isSubmitting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditFlashcardStateImpl &&
            (identical(other.flashcard, flashcard) ||
                other.flashcard == flashcard) &&
            const DeepCollectionEquality()
                .equals(other.isSubmitting, isSubmitting));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flashcard,
      const DeepCollectionEquality().hash(isSubmitting));

  /// Create a copy of EditFlashcardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditFlashcardStateImplCopyWith<_$EditFlashcardStateImpl> get copyWith =>
      __$$EditFlashcardStateImplCopyWithImpl<_$EditFlashcardStateImpl>(
          this, _$identity);
}

abstract class _EditFlashcardState implements EditFlashcardState {
  const factory _EditFlashcardState(
      {required final Flashcard flashcard,
      final dynamic isSubmitting}) = _$EditFlashcardStateImpl;

  @override
  Flashcard get flashcard;
  @override
  dynamic get isSubmitting;

  /// Create a copy of EditFlashcardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditFlashcardStateImplCopyWith<_$EditFlashcardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
