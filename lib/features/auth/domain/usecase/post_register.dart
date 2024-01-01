import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youapp_test/core/errors/failure.dart';
import 'package:youapp_test/core/usecase/usecase.dart';
import 'package:youapp_test/features/auth/domain/entities/register.dart';
import 'package:youapp_test/features/auth/domain/repositories/authentication_repository.dart';

part 'post_register.freezed.dart';
part 'post_register.g.dart';

class PostRegister extends UseCase<Register, RegisterParams> {
  final AuthRepository _repo;

  PostRegister(this._repo);

  @override
  Future<Either<Failure, Register>> call(RegisterParams params) =>
      _repo.register(params);
}

@freezed
class RegisterParams with _$RegisterParams {
  const factory RegisterParams({
    @Default("") String email,
    @Default("") String username,
    @Default("") String password,
  }) = _RegisterParams;

  factory RegisterParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterParamsFromJson(json);
}
