import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:instagram/data/mapper/mapper.auto_mappr.dart';
import 'package:instagram/data/models/post_model.dart';
import 'package:instagram/data/models/user_model.dart';
import 'package:instagram/domain/entities/post.dart';
import 'package:instagram/domain/entities/user.dart';

@AutoMappr([
  MapType<UserModel, User>(),
  MapType<User, UserModel>(),
  MapType<PostModel, Post>(),
  MapType<Post, PostModel>(),
])
class Mappr extends $Mappr {}
