// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_user_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetUserParams {
  String get userId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetUserParamsCopyWith<GetUserParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserParamsCopyWith<$Res> {
  factory $GetUserParamsCopyWith(
          GetUserParams value, $Res Function(GetUserParams) then) =
      _$GetUserParamsCopyWithImpl<$Res, GetUserParams>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$GetUserParamsCopyWithImpl<$Res, $Val extends GetUserParams>
    implements $GetUserParamsCopyWith<$Res> {
  _$GetUserParamsCopyWithImpl(this._value, this._then);

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
abstract class _$$GetUserParamsImplCopyWith<$Res>
    implements $GetUserParamsCopyWith<$Res> {
  factory _$$GetUserParamsImplCopyWith(
          _$GetUserParamsImpl value, $Res Function(_$GetUserParamsImpl) then) =
      __$$GetUserParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$GetUserParamsImplCopyWithImpl<$Res>
    extends _$GetUserParamsCopyWithImpl<$Res, _$GetUserParamsImpl>
    implements _$$GetUserParamsImplCopyWith<$Res> {
  __$$GetUserParamsImplCopyWithImpl(
      _$GetUserParamsImpl _value, $Res Function(_$GetUserParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$GetUserParamsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetUserParamsImpl implements _GetUserParams {
  const _$GetUserParamsImpl({this.userId = ''});

  @override
  @JsonKey()
  final String userId;

  @override
  String toString() {
    return 'GetUserParams(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserParamsImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserParamsImplCopyWith<_$GetUserParamsImpl> get copyWith =>
      __$$GetUserParamsImplCopyWithImpl<_$GetUserParamsImpl>(this, _$identity);
}

abstract class _GetUserParams implements GetUserParams {
  const factory _GetUserParams({final String userId}) = _$GetUserParamsImpl;

  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$GetUserParamsImplCopyWith<_$GetUserParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
