import 'package:get_it/get_it.dart';
import 'package:youapp_test/core/api/dio_client.dart';
import 'package:youapp_test/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:youapp_test/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:youapp_test/features/auth/domain/repositories/authentication_repository.dart';
import 'package:youapp_test/features/auth/domain/usecase/post_login.dart';
import 'package:youapp_test/features/auth/domain/usecase/post_register.dart';
import 'package:youapp_test/features/auth/pages/pages.dart';
import 'package:youapp_test/features/main/cubit/main_cubit.dart';
import 'package:youapp_test/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:youapp_test/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:youapp_test/features/profile/domain/repositories/profile_repository.dart';
import 'package:youapp_test/features/profile/domain/usecases/get_profile.dart';
import 'package:youapp_test/features/profile/domain/usecases/get_profile_image.dart';
import 'package:youapp_test/features/profile/domain/usecases/post_profile.dart';
import 'package:youapp_test/features/profile/pages/cubit/post_profile_cubit.dart';
import 'package:youapp_test/features/profile/pages/cubit/profile_cubit.dart';
import 'package:youapp_test/features/profile/pages/cubit/profile_image_cubit.dart';
import 'package:youapp_test/utils/utils.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator({
  bool isUnitTest = false,
  bool isHiveEnable = true,
  String prefixBox = '',
}) async {
  /// For unit testing only
  if (isUnitTest) {
    await sl.reset();
  }
  sl.registerSingleton<DioClient>(DioClient(isUnitTest: isUnitTest));
  _dataSources();
  _repositories();
  _useCase();
  _cubit();
  if (isHiveEnable) {
    await _initHiveBoxes(
      isUnitTest: isUnitTest,
      prefixBox: prefixBox,
    );
  }
}

Future<void> _initHiveBoxes({
  bool isUnitTest = false,
  String prefixBox = '',
}) async {
  await MainBoxMixin.initHive(prefixBox);
  sl.registerSingleton<MainBoxMixin>(MainBoxMixin());
}

/// Register repositories
void _repositories() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImplement(sl(), sl()),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImplement(sl()),
  );
}

/// Register dataSources
void _dataSources() {
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImplement(sl()),
  );
  sl.registerLazySingleton<ProfileRemoteDatasource>(
    () => ProfileRemoteDatasourceImplement(sl()),
  );
}

void _useCase() {
  /// Auth
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => PostRegister(sl()));

  // Profile
  sl.registerLazySingleton(() => GetProfile(sl()));
  sl.registerLazySingleton(() => GetProfileImage(sl()));
  sl.registerLazySingleton(() => PostProfile(sl()));
}

void _cubit() {
  /// Auth
  sl.registerFactory(() => RegisterCubit(sl()));
  sl.registerFactory(() => AuthCubit(sl()));

  sl.registerFactory(() => MainCubit());

  /// Profile
  sl.registerFactory(() => ProfileCubit(sl()));
  sl.registerFactory(() => ProfileImageCubit(sl()));
  sl.registerFactory(() => PostProfileCubit(sl()));
}
