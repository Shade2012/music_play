import 'package:hive/hive.dart';

import 'package:music_play_bloc/feature/profile/data/datasources/remote/user_remote_data_sources.dart';
import 'package:music_play_bloc/feature/profile/data/models/user_model.dart';
import 'package:music_play_bloc/feature/profile/domain/entities/user_entities.dart';
import 'package:music_play_bloc/feature/profile/domain/repository/user_repository.dart';
import '../../../../core/error/failure.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository{

  final UserRemoteDataSources userRemoteDataSources;
  UserRepositoryImpl({
    required this.userRemoteDataSources,
  });
  @override
  Future<Either<Failure, List<User>>> getAllUser() async {
    try{
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        //Ngambil Local
        return Left(Failure(message: 'Tidak ada internet'));
      }else{
        //Ngambil Remote
        List<UserModel> hasil = await userRemoteDataSources.getAllUser();

        return Right(hasil);
      }
    }catch(e){
      return Left(Failure(message: '$e'));
    }
  }

  @override
  Future<Either<Failure, User>> getUser() async {
    try{
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Left(Failure(message: 'Tidak ada internet'));
      }else{
        //Ngambil Remote
        UserModel hasil = await userRemoteDataSources.getUser();
        return Right(hasil);
      }
    }catch(e){
      return Left(Failure(message: '$e'));
    }
  }

  @override
  Future<Either<Failure, String>> logout() async {
    try{
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        //Ngambil Local
        String hasil = 'Tidak ada internet';
        return Right(hasil);
      }else{
        //Ngambil Remote
        String hasil = await userRemoteDataSources.logout();
        return Right(hasil);
      }
    }catch(e){
      return Left(Failure(message: '$e'));
    }
  }

}


