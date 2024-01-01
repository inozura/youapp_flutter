import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:youapp_test/core/errors/failure.dart';
import 'package:youapp_test/dependencies_injection.dart';
import 'package:youapp_test/features/auth/data/models/login_response.dart';
import 'package:youapp_test/features/auth/data/models/register_response.dart';
import 'package:youapp_test/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:youapp_test/features/auth/domain/entities/login.dart';
import 'package:youapp_test/features/auth/domain/entities/register.dart';
import 'package:youapp_test/features/auth/domain/usecase/post_login.dart';
import 'package:youapp_test/features/auth/domain/usecase/post_register.dart';

import '../../../../helpers/fake_path_provider_platform.dart';
import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';
import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late MockAuthRemoteDatasource mockAuthRemoteDatasource;
  late AuthRepositoryImplement authRepositoryImpl;
  late Login login;
  late Register register;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(
      isUnitTest: true,
      prefixBox: 'auth_repository_impl_test_',
    );
    mockAuthRemoteDatasource = MockAuthRemoteDatasource();
    authRepositoryImpl =
        AuthRepositoryImplement(mockAuthRemoteDatasource, sl());
    login = LoginResponse.fromJson(
      json.decode(jsonReader(successLoginPath)) as Map<String, dynamic>,
    ).toEntity();
    register = RegisterResponse.fromJson(
      json.decode(jsonReader(successRegisterPath)) as Map<String, dynamic>,
    ).toEntity();
  });

  group("login", () {
    const loginParams = LoginParams(email: "email", password: "password");
    test('should return login when call data is successful', () async {
      // arrange
      when(mockAuthRemoteDatasource.login(loginParams)).thenAnswer(
        (_) async => Right(
          LoginResponse.fromJson(
            json.decode(jsonReader(successLoginPath)) as Map<String, dynamic>,
          ),
        ),
      );

      // act
      final result = await authRepositoryImpl.login(loginParams);

      // assert
      verify(mockAuthRemoteDatasource.login(loginParams));

      expect(result, Right(login));
    });

    test(
      'should return server failure when call data is unsuccessful',
      () async {
        // arrange
        when(mockAuthRemoteDatasource.login(loginParams))
            .thenAnswer((_) async => const Left(ServerFailure('')));

        // act
        final result = await authRepositoryImpl.login(loginParams);

        // assert
        verify(mockAuthRemoteDatasource.login(loginParams));
        expect(result, const Left(ServerFailure('')));
      },
    );
  });

  group("register", () {
    const registerParams = RegisterParams(email: "email", password: "password");
    test('should return register when call data is successful', () async {
      // arrange
      when(mockAuthRemoteDatasource.register(registerParams)).thenAnswer(
        (_) async => Right(
          RegisterResponse.fromJson(
            json.decode(jsonReader(successRegisterPath))
                as Map<String, dynamic>,
          ),
        ),
      );

      // act
      final result = await authRepositoryImpl.register(registerParams);

      // assert
      verify(mockAuthRemoteDatasource.register(registerParams));
      expect(result, equals(Right(register)));
    });

    test(
      'should return server failure when call data is unsuccessful',
      () async {
        // arrange
        when(mockAuthRemoteDatasource.register(registerParams))
            .thenAnswer((_) async => const Left(ServerFailure('')));

        // act
        final result = await authRepositoryImpl.register(registerParams);

        // assert
        verify(mockAuthRemoteDatasource.register(registerParams));
        expect(result, const Left(ServerFailure('')));
      },
    );
  });
}
