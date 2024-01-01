import 'package:dartz/dartz.dart';
import 'package:youapp_test/core/errors/failure.dart';
import 'package:youapp_test/features/auth/domain/entities/login.dart';
import 'package:youapp_test/features/auth/domain/entities/register.dart';
import 'package:youapp_test/features/auth/domain/usecase/post_login.dart';
import 'package:youapp_test/features/auth/domain/usecase/post_register.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> login(LoginParams loginParams);
  Future<Either<Failure, Register>> register(RegisterParams registerParams);
}
