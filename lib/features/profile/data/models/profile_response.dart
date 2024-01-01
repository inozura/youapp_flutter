import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youapp_test/features/profile/domain/entities/profile.dart';

part 'profile_response.freezed.dart';
part 'profile_response.g.dart';

@freezed
class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    bool? success,
    DataProfile? data,
  }) = _ProfileResponse;

  const ProfileResponse._();

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Profile toEntity() => Profile(success: success, data: data);
}

@freezed
class DataProfile with _$DataProfile {
  const factory DataProfile({
    String? userId,
    String? displayName,
    String? image,
    String? gender,
    String? date,
    String? heroscope,
    String? zodiac,
    int? height,
    int? weight,
    List<String>? interest,
  }) = _DataProfile;

  factory DataProfile.fromJson(Map<String, dynamic> json) =>
      _$DataProfileFromJson(json);
}
