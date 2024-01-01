import 'package:dartz/dartz.dart';
import 'package:youapp_test/core/errors/failure.dart';
import 'package:youapp_test/core/usecase/usecase.dart';
import 'package:youapp_test/features/profile/domain/repositories/profile_repository.dart';

class GetProfileImage extends NoParams {
  final ProfileRepository _repo;

  GetProfileImage(this._repo);

  @override
  Future<Either<Failure, dynamic>> call() => _repo.profileImage();
}
