import 'package:dartz/dartz.dart';
import 'package:trado_app/core/errors/failures.dart';
import 'package:trado_app/features/auth/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signIn(String email, String password);
  Future<Either<Failure, Unit>> signUp(
      String email, String password, String username);
  Future<Either<Failure, Unit>> signOut();
  Future<Either<Failure, User>> getCurrentUser();
}
