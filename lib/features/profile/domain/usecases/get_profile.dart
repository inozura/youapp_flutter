import 'package:dartz/dartz.dart';
import 'package:youapp_test/core/errors/failure.dart';
import 'package:youapp_test/core/usecase/usecase.dart';
import 'package:youapp_test/features/profile/domain/entities/profile.dart';
import 'package:youapp_test/features/profile/domain/repositories/profile_repository.dart';

class GetProfile extends NoParams {
  final ProfileRepository _repo;

  GetProfile(this._repo);

  @override
  Future<Either<Failure, Profile?>> call() => _repo.profile();
}
