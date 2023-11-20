import 'package:equatable/equatable.dart';

abstract class Failure with EquatableMixin {
  Failure({required this.stackTrace});

  final String? stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}

class ServerFailure extends Failure with EquatableMixin {
  ServerFailure({super.stackTrace});
}

class CacheFailure extends Failure with EquatableMixin {
  CacheFailure({super.stackTrace});
}

class GeneralFailure extends Failure with EquatableMixin {
  GeneralFailure({super.stackTrace});
}
