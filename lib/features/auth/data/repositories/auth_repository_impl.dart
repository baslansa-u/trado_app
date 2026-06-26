import 'package:dartz/dartz.dart';
import 'package:trado_app/core/errors/exceptions.dart';
import 'package:trado_app/core/errors/failures.dart';
import 'package:trado_app/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:trado_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:trado_app/features/auth/domain/entities/user.dart';
import 'package:trado_app/features/auth/domain/repositories/auth_repository.dart';

final class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDataSource;
  final AuthLocalDatasource localDataSource;

  AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, User>> signIn(String email, String password) async {
    try {
      final response = await remoteDataSource.signIn(email, password);
      await localDataSource.saveToken(response.token);
      return Right(response.user.toEntity());
    } on ServerException catch (e) {
      return Left(NetworkFailure('Failed to sign in: ${e.toString()}', 500));
    } on CacheException catch (e) {
      return Left(CacheFailure('Failed to save token: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await remoteDataSource.signOut();
      await localDataSource.deleteToken();
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(NetworkFailure('Failed to sign out: ${e.toString()}', 500));
    } on CacheException catch (e) {
      return Left(CacheFailure('Failed to delete token: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Unit>> signUp(
      String email, String password, String username) async {
    try {
      await remoteDataSource.signUp(email, password, username);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(NetworkFailure('Failed to sign up: ${e.toString()}', 500));
    } on CacheException catch (e) {
      return Left(CacheFailure('Failed to save token: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUser();
      return Right(user.toEntity());
    } on ServerException catch (e) {
      return Left(
          NetworkFailure('Failed to get current user: ${e.toString()}', 500));
    } on CacheException catch (e) {
      return Left(CacheFailure('Failed to get current user: ${e.toString()}'));
    }
  }
}
