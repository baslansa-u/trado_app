import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:trado_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'core/router/app_router.dart';

final sl = GetIt.instance;

Future<void> setupDependencyInjection() async {
  sl.registerLazySingleton(
    () => AuthBloc(sl()),
  );

  sl.registerLazySingleton(
    () => FlutterSecureStorage(),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencyInjection();

  runApp(const TradoApp());
}

class TradoApp extends StatelessWidget {
  const TradoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Trado App',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      routerConfig: AppRouter.router,
    );
  }
}
