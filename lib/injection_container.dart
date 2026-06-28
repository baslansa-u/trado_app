import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:trado_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:trado_app/features/auth/data/datasources/auth_local_datasource_impl.dart';
import 'package:trado_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:trado_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:trado_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:trado_app/features/auth/domain/usecases/get_current_user.dart';
import 'package:trado_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:trado_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:trado_app/features/auth/domain/usecases/sign_up_usecase.dart';

import 'features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // dio
  sl.registerLazySingleton(() => Dio());
  // storage
  sl.registerLazySingleton(
    () => FlutterSecureStorage(),
  );
  // datasource
  sl.registerLazySingleton<AuthLocalDatasource>(
    () => AuthLocalDatasourceImpl(sl()),
  );
  sl.registerLazySingleton(
    () => AuthRemoteDatasource(sl()),
  );
  // repo
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );
  // usecase
  sl.registerLazySingleton(() => SignInUsecase(sl()));
  sl.registerLazySingleton(() => SignOutUsecase(sl()));
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  sl.registerLazySingleton(() => SignUpUsecase(sl()));
  // authBloc
  sl.registerFactory(
    () => AuthBloc(
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );
}
