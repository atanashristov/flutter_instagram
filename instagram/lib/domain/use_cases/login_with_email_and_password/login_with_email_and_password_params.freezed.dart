// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_with_email_and_password_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LogInWithEmailAndPasswordParams {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LogInWithEmailAndPasswordParamsCopyWith<LogInWithEmailAndPasswordParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogInWithEmailAndPasswordParamsCopyWith<$Res> {
  factory $LogInWithEmailAndPasswordParamsCopyWith(
          LogInWithEmailAndPasswordParams value,
          $Res Function(LogInWithEmailAndPasswordParams) then) =
      _$LogInWithEmailAndPasswordParamsCopyWithImpl<$Res,
          LogInWithEmailAndPasswordParams>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LogInWithEmailAndPasswordParamsCopyWithImpl<$Res,
        $Val extends LogInWithEmailAndPasswordParams>
    implements $LogInWithEmailAndPasswordParamsCopyWith<$Res> {
  _$LogInWithEmailAndPasswordParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$LogInWithEmailAndPasswordParamsImplCopyWith<$Res>
    implements $LogInWithEmailAndPasswordParamsCopyWith<$Res> {
  factory _$$LogInWithEmailAndPasswordParamsImplCopyWith(
          _$LogInWithEmailAndPasswordParamsImpl value,
          $Res Function(_$LogInWithEmailAndPasswordParamsImpl) then) =
      __$$LogInWithEmailAndPasswordParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LogInWithEmailAndPasswordParamsImplCopyWithImpl<$Res>
    extends _$LogInWithEmailAndPasswordParamsCopyWithImpl<$Res,
        _$LogInWithEmailAndPasswordParamsImpl>
    implements _$$LogInWithEmailAndPasswordParamsImplCopyWith<$Res> {
  __$$LogInWithEmailAndPasswordParamsImplCopyWithImpl(
      _$LogInWithEmailAndPasswordParamsImpl _value,
      $Res Function(_$LogInWithEmailAndPasswordParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$LogInWithEmailAndPasswordParamsImpl(
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

class _$LogInWithEmailAndPasswordParamsImpl
    implements _LogInWithEmailAndPasswordParams {
  const _$LogInWithEmailAndPasswordParamsImpl(
      {this.email = '', this.password = ''});

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;

  @override
  String toString() {
    return 'LogInWithEmailAndPasswordParams(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogInWithEmailAndPasswordParamsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogInWithEmailAndPasswordParamsImplCopyWith<
          _$LogInWithEmailAndPasswordParamsImpl>
      get copyWith => __$$LogInWithEmailAndPasswordParamsImplCopyWithImpl<
          _$LogInWithEmailAndPasswordParamsImpl>(this, _$identity);
}

abstract class _LogInWithEmailAndPasswordParams
    implements LogInWithEmailAndPasswordParams {
  const factory _LogInWithEmailAndPasswordParams(
      {final String email,
      final String password}) = _$LogInWithEmailAndPasswordParamsImpl;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LogInWithEmailAndPasswordParamsImplCopyWith<
          _$LogInWithEmailAndPasswordParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
