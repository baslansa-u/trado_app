import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:trado_app/features/auth/domain/usecases/get_current_user.dart';
import 'package:trado_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:trado_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:trado_app/features/auth/domain/usecases/sign_up_usecase.dart';

import 'features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // AuthBloc
  sl.registerLazySingleton(
    () => AuthBloc(
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );
  sl.registerLazySingleton(() => SignInUsecase(sl()));
  sl.registerLazySingleton(() => SignOutUsecase(sl()));
  sl.registerLazySingleton(() => GetCurrentUser(sl()));
  sl.registerLazySingleton(() => SignUpUsecase(sl()));

  // Storage
  sl.registerLazySingleton(
    () => FlutterSecureStorage(),
  );
}
