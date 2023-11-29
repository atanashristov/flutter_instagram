// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_with_email_and_password_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpWithEmailAndPasswordParams {
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpWithEmailAndPasswordParamsCopyWith<SignUpWithEmailAndPasswordParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpWithEmailAndPasswordParamsCopyWith<$Res> {
  factory $SignUpWithEmailAndPasswordParamsCopyWith(
          SignUpWithEmailAndPasswordParams value,
          $Res Function(SignUpWithEmailAndPasswordParams) then) =
      _$SignUpWithEmailAndPasswordParamsCopyWithImpl<$Res,
          SignUpWithEmailAndPasswordParams>;
  @useResult
  $Res call({String username, String email, String password});
}

/// @nodoc
class _$SignUpWithEmailAndPasswordParamsCopyWithImpl<$Res,
        $Val extends SignUpWithEmailAndPasswordParams>
    implements $SignUpWithEmailAndPasswordParamsCopyWith<$Res> {
  _$SignUpWithEmailAndPasswordParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpWithEmailAndPasswordParamsImplCopyWith<$Res>
    implements $SignUpWithEmailAndPasswordParamsCopyWith<$Res> {
  factory _$$SignUpWithEmailAndPasswordParamsImplCopyWith(
          _$SignUpWithEmailAndPasswordParamsImpl value,
          $Res Function(_$SignUpWithEmailAndPasswordParamsImpl) then) =
      __$$SignUpWithEmailAndPasswordParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String email, String password});
}

/// @nodoc
class __$$SignUpWithEmailAndPasswordParamsImplCopyWithImpl<$Res>
    extends _$SignUpWithEmailAndPasswordParamsCopyWithImpl<$Res,
        _$SignUpWithEmailAndPasswordParamsImpl>
    implements _$$SignUpWithEmailAndPasswordParamsImplCopyWith<$Res> {
  __$$SignUpWithEmailAndPasswordParamsImplCopyWithImpl(
      _$SignUpWithEmailAndPasswordParamsImpl _value,
      $Res Function(_$SignUpWithEmailAndPasswordParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignUpWithEmailAndPasswordParamsImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignUpWithEmailAndPasswordParamsImpl
    implements _SignUpWithEmailAndPasswordParams {
  const _$SignUpWithEmailAndPasswordParamsImpl(
      {this.username = '', this.email = '', this.password = ''});

  @override
  @JsonKey()
  final String username;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;

  @override
  String toString() {
    return 'SignUpWithEmailAndPasswordParams(username: $username, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpWithEmailAndPasswordParamsImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpWithEmailAndPasswordParamsImplCopyWith<
          _$SignUpWithEmailAndPasswordParamsImpl>
      get copyWith => __$$SignUpWithEmailAndPasswordParamsImplCopyWithImpl<
          _$SignUpWithEmailAndPasswordParamsImpl>(this, _$identity);
}

abstract class _SignUpWithEmailAndPasswordParams
    implements SignUpWithEmailAndPasswordParams {
  const factory _SignUpWithEmailAndPasswordParams(
      {final String username,
      final String email,
      final String password}) = _$SignUpWithEmailAndPasswordParamsImpl;

  @override
  String get username;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$SignUpWithEmailAndPasswordParamsImplCopyWith<
          _$SignUpWithEmailAndPasswordParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
