import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:trado_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:trado_app/features/auth/presentation/pages/auth_page.dart';
import 'package:trado_app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:trado_app/main.dart';

class BlocRefreshListenable extends ChangeNotifier {
  late final StreamSubscription _sub;

  BlocRefreshListenable(Stream stream) {
    _sub = stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}

class AppRouter {
  static const String auth = '/auth';
  static const String dashboard = '/';

  static final GoRouter router = GoRouter(
    refreshListenable: BlocRefreshListenable(sl<AuthBloc>().stream),
    initialLocation: auth,
    redirect: (context, state) async {
      final secureStorage = sl<FlutterSecureStorage>();
      final token = await secureStorage.read(key: 'auth_token');
      final isLoggedIn = token != null;
      final isOnAuth = state.matchedLocation == '/auth';

      if (!isLoggedIn && !isOnAuth) {
        return '/auth';
      } else if (isLoggedIn && isOnAuth) {
        return '/dashboard';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: auth,
        builder: (context, state) => const AuthPage(),
      ),
      GoRoute(
        path: dashboard,
        builder: (context, state) => const DashboardPage(),
      ),
    ],
  );
}
