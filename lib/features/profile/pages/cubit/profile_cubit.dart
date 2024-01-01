import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youapp_test/core/errors/failure.dart';
import 'package:youapp_test/features/profile/domain/entities/profile.dart';
import 'package:youapp_test/features/profile/domain/usecases/get_profile.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetProfile _getProfile;

  ProfileCubit(this._getProfile) : super(const _Loading());

  Future<void> fetchProfile() async {
    emit(const _Loading());

    final data = await _getProfile.call();
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
