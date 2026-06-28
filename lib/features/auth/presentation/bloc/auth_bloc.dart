import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trado_app/features/auth/domain/entities/user.dart';
import 'package:trado_app/features/auth/domain/usecases/get_current_user.dart';
import 'package:trado_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:trado_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:trado_app/features/auth/domain/usecases/sign_up_usecase.dart';

part 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUsecase signInUsecase;
  final SignOutUsecase signOutUsecase;
  final GetCurrentUser getCurrentUser;
  final SignUpUsecase signUpUsecase;

  AuthBloc(
    this.signInUsecase,
    this.signOutUsecase,
    this.getCurrentUser,
    this.signUpUsecase,
  ) : super(AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<SignedOut>(_onSignedOut);
    on<SignInRequested>(_onSignInRequested);
    on<SignUpRequested>(_onSignUpRequested);
  }

  Future<void> _onAuthCheckRequested(
      AuthCheckRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await getCurrentUser();
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) {
        emit(
          Authenticated(user: user),
        );
      },
    );
  }

  Future<void> _onSignedOut(SignedOut event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await signOutUsecase();
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) => emit(Unauthenticated()),
    );
  }

  Future<void> _onSignInRequested(
      SignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await signInUsecase(
      SignInParams(email: event.email, password: event.password),
    );
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(Authenticated(user: user)),
    );
  }

  Future<void> _onSignUpRequested(
      SignUpRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await signUpUsecase(
      SignUpParams(
          email: event.email,
          password: event.password,
          username: event.username),
    );
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(Unauthenticated()),
    );
  }
}
