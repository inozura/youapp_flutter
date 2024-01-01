import 'package:dartz/dartz.dart';
import 'package:youapp_test/core/errors/failure.dart';
import 'package:youapp_test/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:youapp_test/features/auth/domain/entities/login.dart';
import 'package:youapp_test/features/auth/domain/entities/register.dart';
import 'package:youapp_test/features/auth/domain/repositories/authentication_repository.dart';
import 'package:youapp_test/features/auth/domain/usecase/post_login.dart';
import 'package:youapp_test/features/auth/domain/usecase/post_register.dart';
import 'package:youapp_test/utils/utils.dart';

class AuthRepositoryImplement implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  final MainBoxMixin mainBoxMixin;

  const AuthRepositoryImplement(this.authRemoteDatasource, this.mainBoxMixin);

  @override
  Future<Either<Failure, Login>> login(LoginParams loginParams) async {
    final response = await authRemoteDatasource.login(loginParams);

    return response.fold(
      (failure) => Left(failure),
      (loginResponse) {
        mainBoxMixin.addData(MainBoxKeys.isLogin, true);
        mainBoxMixin.addData(MainBoxKeys.token, loginResponse.token);

        return Right(loginResponse.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, Register>> register(
      RegisterParams registerParams) async {
    final response = await authRemoteDatasource.register(registerParams);

    return response.fold(
      (failure) => Left(failure),
      (registerResponse) {
        return Right(registerResponse.toEntity());
      },
    );
  }
}
