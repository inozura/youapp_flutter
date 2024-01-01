import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_image.freezed.dart';

@freezed
class ProfileImage with _$ProfileImage {
  const factory ProfileImage({
    bool? success,
    String? data,
  }) = _ProfileImage;
}
