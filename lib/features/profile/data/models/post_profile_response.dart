import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youapp_test/features/profile/data/models/profile_response.dart';
import 'package:youapp_test/features/profile/domain/entities/profile.dart';

part 'post_profile_response.freezed.dart';
part 'post_profile_response.g.dart';

@freezed
class PostProfileResponse with _$PostProfileResponse {
  const factory PostProfileResponse({
    bool? success,
    DataProfile? data,
  }) = _PostProfileResponse;

  const PostProfileResponse._();

  factory PostProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$PostProfileResponseFromJson(json);

  Profile toEntity() => Profile(success: success, data: data);
}
