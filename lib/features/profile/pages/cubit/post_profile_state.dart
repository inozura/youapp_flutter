part of 'post_profile_cubit.dart';

@freezed
class PostProfileState with _$PostProfileState {
  const factory PostProfileState.loading() = _Loading;
  const factory PostProfileState.success(Profile? data) = _Success;
  const factory PostProfileState.failure(String message) = _Failure;
  const factory PostProfileState.empty() = _Empty;
}
