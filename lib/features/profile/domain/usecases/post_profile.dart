import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youapp_test/core/errors/failure.dart';
import 'package:youapp_test/core/usecase/usecase.dart';
import 'package:youapp_test/features/profile/domain/entities/profile.dart';
import 'package:youapp_test/features/profile/domain/repositories/profile_repository.dart';

part 'post_profile.freezed.dart';
part 'post_profile.g.dart';

class PostProfile extends UseCase<Profile, PostProfileParams> {
  final ProfileRepository _repo;

  PostProfile(this._repo);

  @override
  Future<Either<Failure, Profile>> call(PostProfileParams params) =>
      _repo.postProfile(params);
}

@freezed
class PostProfileParams with _$PostProfileParams {
  const factory PostProfileParams({
    @Default("") String displayName,
    @Default("") String? gender,
    @Default("") String? birtday,
    @Default("") String? heroscope,
    @Default("") String? zodiac,
    @Default(0) int? height,
    @Default(0) int? weight,
    @Default(null) Object? image,
  }) = _PostProfileParams;

  factory PostProfileParams.fromJson(Map<String, dynamic> json) =>
      _$PostProfileParamsFromJson(json);
}
