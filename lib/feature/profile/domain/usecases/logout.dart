// class GetUsew
import 'package:dartz/dartz.dart';

import 'package:music_play_bloc/core/error/failure.dart';

import '../entities/user_entities.dart';
import '../repository/user_repository.dart';

class Logout {
  final UserRepository userRepository;
  Logout(this.userRepository);

  Future<Either<Failure, String>> execute () async {
    return await userRepository.logout();
  }
}
