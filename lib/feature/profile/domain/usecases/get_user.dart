// class GetUsew
import 'package:dartz/dartz.dart';

import 'package:music_play_bloc/core/error/failure.dart';

import '../entities/user_entities.dart';
import '../repository/user_repository.dart';

class GetUser {
  final UserRepository userRepository;
  GetUser(this.userRepository);

  Future<Either<Failure, User>> execute () async {
    return await userRepository.getUser();
  }
}
