import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youapp_test/features/profile/data/models/profile_response.dart';

part 'profile.freezed.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
    bool? success,
    DataProfile? data,
  }) = _Profile;
}
