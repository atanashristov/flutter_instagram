import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram/domain/entities/entity_base.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User extends EntityBase<String> with _$User {
  const factory User({
    @Default('') String id,
    @Default('') String username,
    @Default('') String email,
    String? profileImageUrl,
    @Default(0) int followers,
    @Default(0) int following,
    String? bio,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static const empty = User();
}
