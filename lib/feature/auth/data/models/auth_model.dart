
import 'package:music_play_bloc/feature/auth/domain/entities/login_entities.dart';

class AuthModelLogin extends LoginEntities {
  AuthModelLogin({
    required String token,
    required bool success
  }) : super(token: token,success: success);

  factory AuthModelLogin.fromJson(Map<String, dynamic> json) {
    return AuthModelLogin(
      token: json['token'],
      success: json['success'],
    );
  }
}
