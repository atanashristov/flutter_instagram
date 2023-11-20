import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram/domain/use_cases/use_case_base.dart';

part 'upload_profile_image_params.freezed.dart';

@freezed
class UploadProfileImageParams extends ParamsBase with _$UploadProfileImageParams {
  const factory UploadProfileImageParams(
    File profileImage, {
    String? profileImageUrl,
  }) = _UploadProfileImageParams;
}
