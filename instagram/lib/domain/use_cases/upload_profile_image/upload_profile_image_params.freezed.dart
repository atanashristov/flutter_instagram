// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_profile_image_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UploadProfileImageParams {
  File get profileImage => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadProfileImageParamsCopyWith<UploadProfileImageParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadProfileImageParamsCopyWith<$Res> {
  factory $UploadProfileImageParamsCopyWith(UploadProfileImageParams value,
          $Res Function(UploadProfileImageParams) then) =
      _$UploadProfileImageParamsCopyWithImpl<$Res, UploadProfileImageParams>;
  @useResult
  $Res call({File profileImage, String? profileImageUrl});
}

/// @nodoc
class _$UploadProfileImageParamsCopyWithImpl<$Res,
        $Val extends UploadProfileImageParams>
    implements $UploadProfileImageParamsCopyWith<$Res> {
  _$UploadProfileImageParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileImage = null,
    Object? profileImageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as File,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadProfileImageParamsImplCopyWith<$Res>
    implements $UploadProfileImageParamsCopyWith<$Res> {
  factory _$$UploadProfileImageParamsImplCopyWith(
          _$UploadProfileImageParamsImpl value,
          $Res Function(_$UploadProfileImageParamsImpl) then) =
      __$$UploadProfileImageParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({File profileImage, String? profileImageUrl});
}

/// @nodoc
class __$$UploadProfileImageParamsImplCopyWithImpl<$Res>
    extends _$UploadProfileImageParamsCopyWithImpl<$Res,
        _$UploadProfileImageParamsImpl>
    implements _$$UploadProfileImageParamsImplCopyWith<$Res> {
  __$$UploadProfileImageParamsImplCopyWithImpl(
      _$UploadProfileImageParamsImpl _value,
      $Res Function(_$UploadProfileImageParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileImage = null,
    Object? profileImageUrl = freezed,
  }) {
    return _then(_$UploadProfileImageParamsImpl(
      null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as File,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UploadProfileImageParamsImpl implements _UploadProfileImageParams {
  const _$UploadProfileImageParamsImpl(this.profileImage,
      {this.profileImageUrl});

  @override
  final File profileImage;
  @override
  final String? profileImageUrl;

  @override
  String toString() {
    return 'UploadProfileImageParams(profileImage: $profileImage, profileImageUrl: $profileImageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadProfileImageParamsImpl &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileImage, profileImageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadProfileImageParamsImplCopyWith<_$UploadProfileImageParamsImpl>
      get copyWith => __$$UploadProfileImageParamsImplCopyWithImpl<
          _$UploadProfileImageParamsImpl>(this, _$identity);
}

abstract class _UploadProfileImageParams implements UploadProfileImageParams {
  const factory _UploadProfileImageParams(final File profileImage,
      {final String? profileImageUrl}) = _$UploadProfileImageParamsImpl;

  @override
  File get profileImage;
  @override
  String? get profileImageUrl;
  @override
  @JsonKey(ignore: true)
  _$$UploadProfileImageParamsImplCopyWith<_$UploadProfileImageParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
