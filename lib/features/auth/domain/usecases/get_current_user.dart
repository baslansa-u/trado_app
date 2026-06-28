import 'package:dartz/dartz.dart';
import 'package:trado_app/core/errors/failures.dart';
import 'package:trado_app/features/auth/domain/entities/user.dart';
import 'package:trado_app/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUser {
  final AuthRepository authRepository;
  GetCurrentUser(this.authRepository);

  Future<Either<Failure, User>> call() async {
    return await authRepository.getCurrentUser();
  }
}
