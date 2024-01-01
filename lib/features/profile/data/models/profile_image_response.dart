import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youapp_test/features/profile/domain/entities/profile_image.dart';

part 'profile_image_response.freezed.dart';
part 'profile_image_response.g.dart';

@freezed
class ProfileImageResponse with _$ProfileImageResponse {
  const factory ProfileImageResponse({
    bool? success,
    String? data,
  }) = _ProfileImageResponse;

  const ProfileImageResponse._();

  factory ProfileImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileImageResponseFromJson(json);

  ProfileImage toEntity() => ProfileImage(success: success, data: data);
}
