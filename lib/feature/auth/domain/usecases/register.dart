import 'package:dartz/dartz.dart';
import 'package:music_play_bloc/core/error/failure.dart';
import 'package:music_play_bloc/feature/auth/domain/entities/register_entities.dart';
import 'package:music_play_bloc/feature/auth/domain/repositories/auth_repository.dart';

class Register {
  final AuthRepository authRepository;
  Register(this.authRepository);
  Future<Either<Failure, RegisterEntities>> execute (String name,String email,String password) async {
    try{
      return await authRepository.register(name:name,email:email,password:password);
    }catch(e){
      return Left(Failure(message: 'Failed to register')); // Return Failure on any exception
    }
  }
}
