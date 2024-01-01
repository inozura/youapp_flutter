import 'package:dartz/dartz.dart';
import 'package:youapp_test/core/api/dio_client.dart';
import 'package:youapp_test/core/api/list_api.dart';
import 'package:youapp_test/core/errors/failure.dart';
import 'package:youapp_test/features/auth/data/models/login_response.dart';
import 'package:youapp_test/features/auth/data/models/register_response.dart';
import 'package:youapp_test/features/auth/domain/usecase/post_login.dart';
import 'package:youapp_test/features/auth/domain/usecase/post_register.dart';
import 'package:youapp_test/utils/utils.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failure, RegisterResponse>> register(
      RegisterParams registerParams);

  Future<Either<Failure, LoginResponse>> login(LoginParams loginParams);
}

class AuthRemoteDatasourceImplement implements AuthRemoteDatasource {
  final DioClient _client;

  AuthRemoteDatasourceImplement(this._client);

  @override
  Future<Either<Failure, RegisterResponse>> register(
      RegisterParams registerParams) async {
    final response = await _client.postRequest(ListAPI.register,
        data: registerParams.toJson(),
        converter: (res) =>
            RegisterResponse.fromJson(res as Map<String, dynamic>));

    return response;
  }

  @override
  Future<Either<Failure, LoginResponse>> login(LoginParams loginParams) async {
    final response = await _client.postRequest(ListAPI.login,
        data: loginParams.toJson(),
        converter: (res) => LoginResponse.fromJson(res));

    return response;
  }
}
