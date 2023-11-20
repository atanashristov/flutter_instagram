import 'package:either_dart/either.dart';
import 'package:instagram/domain/entities/post.dart';
import 'package:instagram/domain/failures/failures.dart';

abstract class PostRepository {
  Future<Either<Failure, Post>> getPost({required String id});
}
