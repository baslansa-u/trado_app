import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:trado_app/core/errors/failures.dart';
import 'package:trado_app/features/auth/domain/entities/user.dart';
import 'package:trado_app/features/auth/domain/repositories/auth_repository.dart';

class SignInUsecase {
  final AuthRepository repository;

  SignInUsecase(this.repository);

  Future<Either<Failure, User>> call(SignInParams params) =>
      repository.signIn(params.email, params.password);
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
