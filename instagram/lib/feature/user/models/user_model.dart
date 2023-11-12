import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @Default('') String id,
    @Default('') String username,
    @Default('') String email,
    String? profileImageUrl,
    @Default(0) int followers,
    @Default(0) int following,
    String? bio,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);

  static const empty = UserModel();
}
