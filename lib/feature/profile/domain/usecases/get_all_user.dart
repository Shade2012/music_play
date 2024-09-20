

import 'package:dartz/dartz.dart';

import 'package:music_play_bloc/core/error/failure.dart';

import '../entities/user_entities.dart';
import '../repository/user_repository.dart';

class GetAllUser{
  final UserRepository userRepository;
  GetAllUser(this.userRepository);

  //dijalankan
  Future<Either<Failure, List<User>>> execute() async {
  return await userRepository.getAllUser();
  }
}
