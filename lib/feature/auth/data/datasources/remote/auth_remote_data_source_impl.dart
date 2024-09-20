import 'package:dartz/dartz.dart';
import 'package:music_play_bloc/core/error/failure.dart';
import 'package:music_play_bloc/core/network/api_endpoint.dart';
import 'package:music_play_bloc/feature/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:music_play_bloc/feature/auth/data/models/auth_model.dart';
import 'package:music_play_bloc/feature/auth/data/models/auth_model_register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/error/exception.dart';
import '../../../../../core/network/dio_instance.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  DioInstance dio = DioInstance();

  @override
  Future <AuthModelLogin> login(String email, String password) async {
    final response = await dio.postRequest(endpoint: ApiEndPoint.baseUrlLogin,
    data:{
      'email':email,
      'password':password
    } );
    if(response.statusCode == 200){
      Map<String,dynamic> dataBody = response.data;
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', dataBody['token']);
      return AuthModelLogin.fromJson(dataBody);
      // return UserModel.fromJson(data);
    }if(response.statusCode == 404){
      throw const EmptyException(message: 'Data not found Error 404');
    }else{
      throw GeneralException(message: 'Cannot Get Data ${response.data}');
    }
  }

  @override
  Future<AuthModelRegister> register({required String name, required String email, required String password}) async {
    final response = await dio.postRequest(endpoint: ApiEndPoint.baseUrlRegister, data: {
      'name': name,
      'email':email,
      'password':password
    });
    if(response.statusCode == 201){
      return AuthModelRegister.fromJson(response.data);
    }if(response.statusCode == 404){
      throw const EmptyException(message: 'Data not found Error 404');
    }else{
      throw GeneralException(message: 'Cannot Get Data ${response.data}');
    }
  }

}
