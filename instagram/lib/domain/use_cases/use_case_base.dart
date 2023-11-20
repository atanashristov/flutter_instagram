import 'package:either_dart/either.dart';
import 'package:instagram/domain/failures/failures.dart';

abstract class UseCaseBase<TResult, TParams> {
  Future<Either<Failure, TResult>> call(TParams params);
}

abstract class ParamsBase {}

class NoParams extends ParamsBase {}
