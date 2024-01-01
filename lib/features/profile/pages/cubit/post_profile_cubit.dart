import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:youapp_test/core/errors/failure.dart';
import 'package:youapp_test/features/profile/domain/entities/profile.dart';
import 'package:youapp_test/features/profile/domain/usecases/post_profile.dart';

part 'post_profile_cubit.freezed.dart';
part 'post_profile_state.dart';

class PostProfileCubit extends Cubit<PostProfileState> {
  final PostProfile _postProfile;

  PostProfileCubit(this._postProfile) : super(const _Loading());

  Future<void> postProfileImage(PostProfileParams postProfileParams) async {
    emit(const _Loading());

    final data = await _postProfile.call(postProfileParams);
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
