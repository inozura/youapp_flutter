import 'package:dartz/dartz.dart';
import 'package:youapp_test/core/errors/failure.dart';
import 'package:youapp_test/features/profile/domain/entities/profile.dart';
import 'package:youapp_test/features/profile/domain/entities/profile_image.dart';
import 'package:youapp_test/features/profile/domain/usecases/post_profile.dart';

abstract class ProfileRepository {
  // GET
  Future<Either<Failure, Profile?>> profile();
  Future<Either<Failure, ProfileImage?>> profileImage();

  // POST
  Future<Either<Failure, Profile>> postProfile(PostProfileParams params);
}
