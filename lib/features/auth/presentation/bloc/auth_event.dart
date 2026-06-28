part of 'auth_bloc.dart';

sealed class AuthEvent {}

class AuthCheckRequested extends AuthEvent {}

class SignedOut extends AuthEvent {}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  SignInRequested({required this.email, required this.password});
}

class SignUpRequested extends AuthEvent {
  final String username;
  final String email;
  final String password;

  SignUpRequested(
      {required this.username, required this.email, required this.password});
}
