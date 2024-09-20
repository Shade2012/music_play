import 'package:music_play_bloc/feature/auth/domain/entities/register_entities.dart';

class AuthModelRegister extends RegisterEntities {
  AuthModelRegister({
    required String token,
    required bool success
  }) : super(token: token,success: success);

  factory AuthModelRegister.fromJson(Map<String, dynamic> json) {
    return AuthModelRegister(
      token: json['token'],
      success: json['success'],
    );
  }
}
