part of 'profile_image_cubit.dart';

@freezed
class ProfileImageState with _$ProfileImageState {
  const factory ProfileImageState.loading() = _Loading;
  const factory ProfileImageState.success(ProfileImage? data) = _Success;
  const factory ProfileImageState.failure(String message) = _Failure;
  const factory ProfileImageState.empty() = _Empty;
}
