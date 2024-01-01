import 'package:dartz/dartz.dart';
import 'package:youapp_test/core/errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// Class to handle when useCase don't need params
abstract class NoParams<Type> {
  Future<Either<Failure, Type>> call();
}
