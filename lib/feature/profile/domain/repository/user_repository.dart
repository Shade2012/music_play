import '../../../../core/error/failure.dart';
import '../entities/user_entities.dart';
import 'package:dartz/dartz.dart';
abstract class UserRepository{
  //fungsi dartz
  Future<Either<Failure,List<User>>> getAllUser(); //kemungkinan itu ada 2 hasil :  gagal (failure) / berhasil (List User)
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, String>> logout();
}


