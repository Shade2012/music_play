import 'package:dartz/dartz.dart';
import 'package:music_play_bloc/core/error/failure.dart';
import 'package:music_play_bloc/feature/auth/domain/entities/login_entities.dart';
import 'package:music_play_bloc/feature/auth/domain/repositories/auth_repository.dart';

class Login{
  final AuthRepository authRepository;
  Login(this.authRepository);

  //dijalankan
  Future<Either<Failure,LoginEntities>> execute(String email, String password) async {
    try {
      return await authRepository.login(email, password);
    } catch (e) {
      return Left(Failure(message: 'Failed to login')); // Return Failure on any exception
    }
  }
}
