import 'package:dartz/dartz.dart';
import 'package:youapp_test/core/errors/failure.dart';
import 'package:youapp_test/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:youapp_test/features/profile/domain/entities/profile.dart';
import 'package:youapp_test/features/profile/domain/entities/profile_image.dart';
import 'package:youapp_test/features/profile/domain/repositories/profile_repository.dart';
import 'package:youapp_test/features/profile/domain/usecases/post_profile.dart';

class ProfileRepositoryImplement implements ProfileRepository {
  final ProfileRemoteDatasource profileRemoteDatasource;

  const ProfileRepositoryImplement(this.profileRemoteDatasource);

  @override
  Future<Either<Failure, Profile?>> profile() async {
    final response = await profileRemoteDatasource.profile();

    return response.fold(
        (failure) => Left(failure), (success) => Right(success?.toEntity()));
  }

  @override
  Future<Either<Failure, ProfileImage?>> profileImage() async {
    final response = await profileRemoteDatasource.profileImage();

    return response.fold(
        (failure) => Left(failure), (success) => Right(success?.toEntity()));
  }

  @override
  Future<Either<Failure, Profile>> postProfile(PostProfileParams params) async {
    final response = await profileRemoteDatasource.postProfile(params);

    return response.fold(
        (failure) => Left(failure), (success) => Right(success!.toEntity()));
  }
}
