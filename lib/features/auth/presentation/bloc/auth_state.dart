part of 'auth_bloc.dart';

class AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {
  AuthLoadedState();
}

class AuthErrorState extends AuthState {
  AuthErrorState({required this.message});
  final String message;
}