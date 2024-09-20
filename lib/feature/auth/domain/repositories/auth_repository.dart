import 'package:dartz/dartz.dart';
import 'package:music_play_bloc/core/error/failure.dart';
import 'package:music_play_bloc/feature/auth/domain/entities/login_entities.dart';
import 'package:music_play_bloc/feature/auth/domain/entities/register_entities.dart';

abstract class AuthRepository {
  Future<Either<Failure,LoginEntities>> login(String email, String password);
  Future<Either<Failure, RegisterEntities>> register({required String name,required String email,required String password});
}
