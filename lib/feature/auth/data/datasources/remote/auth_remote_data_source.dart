
import 'package:music_play_bloc/feature/auth/data/models/auth_model.dart';
import 'package:music_play_bloc/feature/auth/data/models/auth_model_register.dart';

abstract class AuthRemoteDataSource {
  Future <AuthModelLogin> login(String email, String password);//kemungkinan itu ada 2 hasil :  gagal (failure) / berhasil (List User)
  Future <AuthModelRegister> register({required String name, required String email, required String password});
}
