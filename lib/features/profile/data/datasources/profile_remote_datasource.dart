import 'package:dartz/dartz.dart';
import 'package:youapp_test/core/api/dio_client.dart';
import 'package:youapp_test/core/api/list_api.dart';
import 'package:youapp_test/core/errors/failure.dart';
import 'package:youapp_test/features/profile/data/models/post_profile_response.dart';
import 'package:youapp_test/features/profile/data/models/profile_image_response.dart';
import 'package:youapp_test/features/profile/data/models/profile_response.dart';
import 'package:youapp_test/features/profile/domain/usecases/post_profile.dart';

abstract class ProfileRemoteDatasource {
  Future<Either<Failure, ProfileResponse?>> profile();
  Future<Either<Failure, ProfileImageResponse?>> profileImage();
  Future<Either<Failure, PostProfileResponse?>> postProfile(
      PostProfileParams postProfileParams);
}

class ProfileRemoteDatasourceImplement implements ProfileRemoteDatasource {
  final DioClient _client;

  ProfileRemoteDatasourceImplement(this._client);

  @override
  Future<Either<Failure, ProfileResponse?>> profile() async {
    final response = await _client.getRequest(ListAPI.profile,
        converter: (response) => ProfileResponse.fromJson(response));

    return response;
  }

  @override
  Future<Either<Failure, ProfileImageResponse?>> profileImage() async {
    final response = await _client.getRequest(ListAPI.image,
        converter: (response) => ProfileImageResponse.fromJson(response));

    return response;
  }

  @override
  Future<Either<Failure, PostProfileResponse?>> postProfile(
      PostProfileParams postProfileParams) async {
    final response = await _client.postRequest(ListAPI.postProfile,
        data: postProfileParams.toJson(),
        converter: (response) => PostProfileResponse.fromJson(response));

    return response;
  }
}
