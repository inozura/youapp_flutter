part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.success(Profile? data) = _Success;
  const factory ProfileState.failure(String message) = _Failure;
  const factory ProfileState.empty() = _Empty;
}
