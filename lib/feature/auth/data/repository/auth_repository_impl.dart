import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:music_play_bloc/core/error/failure.dart';
import 'package:music_play_bloc/feature/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:music_play_bloc/feature/auth/domain/entities/login_entities.dart';
import 'package:music_play_bloc/feature/auth/domain/entities/register_entities.dart';
import 'package:music_play_bloc/feature/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {

  // final HiveInterface hive;

  final AuthRemoteDataSource authRemoteDataSource;
  // final AuthLo userLocalDataSources;

  AuthRepositoryImpl({
    // required this.hive,
    required this.authRemoteDataSource,
  });
  @override
  Future<Either<Failure,LoginEntities>> login(String email, String password) async {
      try{
        LoginEntities hasil = await authRemoteDataSource.login(email, password);
        return Right(hasil);
      }catch(e){
        return Left(Failure(message: '$e'));
      }
  }

  @override
  Future<Either<Failure,RegisterEntities>> register({required String name, required String email, required String password}) async {
    try{
      RegisterEntities hasil = await authRemoteDataSource.register(name: name,email: email,password: password);
      return Right(hasil);
    }catch(e){
      return Left(Failure(message: '$e'));
    }
  }



}
