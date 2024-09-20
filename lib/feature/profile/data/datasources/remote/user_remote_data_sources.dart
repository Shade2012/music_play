import 'package:music_play_bloc/feature/profile/data/models/user_model.dart';

abstract class UserRemoteDataSources{
  Future <List<UserModel>> getAllUser(); //kemungkinan itu ada 2 hasil :  gagal (failure) / berhasil (List User)
  Future <UserModel> getUser();
  Future <String> logout();
}


