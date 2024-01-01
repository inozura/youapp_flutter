import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youapp_test/core/errors/failure.dart';
import 'package:youapp_test/features/profile/domain/entities/profile_image.dart';
import 'package:youapp_test/features/profile/domain/usecases/get_profile_image.dart';

part 'profile_image_cubit.freezed.dart';
part 'profile_image_state.dart';

class ProfileImageCubit extends Cubit<ProfileImageState> {
  final GetProfileImage _getProfileImage;

  ProfileImageCubit(this._getProfileImage) : super(const _Loading());

  Future<void> fetchProfileImage() async {
    emit(const _Loading());

    final data = await _getProfileImage.call();
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(_Failure(l.message ?? ""));
        } else if (l is NoDataFailure) {
          emit(const _Empty());
        }
      },
      (r) => emit(_Success(r)),
    );
  }
}
