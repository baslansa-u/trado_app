import 'package:dartz/dartz.dart';
import 'package:trado_app/core/errors/failures.dart';
import 'package:trado_app/features/auth/domain/repositories/auth_repository.dart';

class SignOutUsecase {
  final AuthRepository authRepository;

  SignOutUsecase(this.authRepository);

  Future<Either<Failure, Unit>> call() async {
    return await authRepository.signOut();
  }
}
