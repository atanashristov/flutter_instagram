import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram/domain/entities/entity_base.dart';
import 'package:instagram/domain/entities/user.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post extends EntityBase<String> with _$Post {
  const factory Post({
    @Default('') String id,
    @Default('') String caption,
    @Default(User.empty) User author,
    String? imageUrl,
    @Default(0) int likes,
    DateTime? date,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  static const empty = Post();
}
