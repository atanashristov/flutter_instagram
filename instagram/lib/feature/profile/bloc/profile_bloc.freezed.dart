// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileEvent {
  String get userId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoadUser value) loadUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoadUser value)? loadUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoadUser value)? loadUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileEventCopyWith<ProfileEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileLoadUserImplCopyWith<$Res>
    implements $ProfileEventCopyWith<$Res> {
  factory _$$ProfileLoadUserImplCopyWith(_$ProfileLoadUserImpl value,
          $Res Function(_$ProfileLoadUserImpl) then) =
      __$$ProfileLoadUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$ProfileLoadUserImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ProfileLoadUserImpl>
    implements _$$ProfileLoadUserImplCopyWith<$Res> {
  __$$ProfileLoadUserImplCopyWithImpl(
      _$ProfileLoadUserImpl _value, $Res Function(_$ProfileLoadUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$ProfileLoadUserImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfileLoadUserImpl implements ProfileLoadUser {
  const _$ProfileLoadUserImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'ProfileEvent.loadUser(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileLoadUserImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileLoadUserImplCopyWith<_$ProfileLoadUserImpl> get copyWith =>
      __$$ProfileLoadUserImplCopyWithImpl<_$ProfileLoadUserImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadUser,
  }) {
    return loadUser(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadUser,
  }) {
    return loadUser?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadUser,
    required TResult orElse(),
  }) {
    if (loadUser != null) {
      return loadUser(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoadUser value) loadUser,
  }) {
    return loadUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoadUser value)? loadUser,
  }) {
    return loadUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoadUser value)? loadUser,
    required TResult orElse(),
  }) {
    if (loadUser != null) {
      return loadUser(this);
    }
    return orElse();
  }
}

abstract class ProfileLoadUser implements ProfileEvent {
  const factory ProfileLoadUser({required final String userId}) =
      _$ProfileLoadUserImpl;

  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$ProfileLoadUserImplCopyWith<_$ProfileLoadUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileState {
  ProfileStatus get status => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;
  bool get isCurrentUser => throw _privateConstructorUsedError;
  bool get isGridView => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call(
      {ProfileStatus status,
      UserModel user,
      bool isCurrentUser,
      bool isGridView,
      bool isFollowing,
      Failure? failure});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = null,
    Object? isCurrentUser = null,
    Object? isGridView = null,
    Object? isFollowing = null,
    Object? failure = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProfileStatus,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      isCurrentUser: null == isCurrentUser
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isGridView: null == isGridView
          ? _value.isGridView
          : isGridView // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileStateImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$ProfileStateImplCopyWith(
          _$ProfileStateImpl value, $Res Function(_$ProfileStateImpl) then) =
      __$$ProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProfileStatus status,
      UserModel user,
      bool isCurrentUser,
      bool isGridView,
      bool isFollowing,
      Failure? failure});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$ProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateImpl>
    implements _$$ProfileStateImplCopyWith<$Res> {
  __$$ProfileStateImplCopyWithImpl(
      _$ProfileStateImpl _value, $Res Function(_$ProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? user = null,
    Object? isCurrentUser = null,
    Object? isGridView = null,
    Object? isFollowing = null,
    Object? failure = freezed,
  }) {
    return _then(_$ProfileStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProfileStatus,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      isCurrentUser: null == isCurrentUser
          ? _value.isCurrentUser
          : isCurrentUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isGridView: null == isGridView
          ? _value.isGridView
          : isGridView // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollowing: null == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl implements _ProfileState {
  const _$ProfileStateImpl(
      {this.status = ProfileStatus.initial,
      this.user = UserModel.empty,
      this.isCurrentUser = false,
      this.isGridView = false,
      this.isFollowing = false,
      this.failure = null});

  @override
  @JsonKey()
  final ProfileStatus status;
  @override
  @JsonKey()
  final UserModel user;
  @override
  @JsonKey()
  final bool isCurrentUser;
  @override
  @JsonKey()
  final bool isGridView;
  @override
  @JsonKey()
  final bool isFollowing;
  @override
  @JsonKey()
  final Failure? failure;

  @override
  String toString() {
    return 'ProfileState._(status: $status, user: $user, isCurrentUser: $isCurrentUser, isGridView: $isGridView, isFollowing: $isFollowing, failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isCurrentUser, isCurrentUser) ||
                other.isCurrentUser == isCurrentUser) &&
            (identical(other.isGridView, isGridView) ||
                other.isGridView == isGridView) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, user, isCurrentUser,
      isGridView, isFollowing, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {final ProfileStatus status,
      final UserModel user,
      final bool isCurrentUser,
      final bool isGridView,
      final bool isFollowing,
      final Failure? failure}) = _$ProfileStateImpl;

  @override
  ProfileStatus get status;
  @override
  UserModel get user;
  @override
  bool get isCurrentUser;
  @override
  bool get isGridView;
  @override
  bool get isFollowing;
  @override
  Failure? get failure;
  @override
  @JsonKey(ignore: true)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
