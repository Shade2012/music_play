import 'package:music_play_bloc/core/error/exception.dart';
import 'package:music_play_bloc/core/network/api_endpoint.dart';
import 'package:music_play_bloc/core/network/dio_instance.dart';
import 'package:music_play_bloc/feature/profile/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_remote_data_sources.dart';

class UserRemoteDataSourcesImpl extends UserRemoteDataSources {
  DioInstance dio = DioInstance();
  @override
  Future<List<UserModel>> getAllUser() async {
   final response = await dio.getRequest(endpoint: ApiEndPoint.baseUrlAllUser,isAuthorize: false);
     Map<String,dynamic> dataBody = response.data;
     if(response.statusCode == 200){
       List<dynamic> data = dataBody['user'];
       return UserModel.fromJsonList(data);
     }if(response.statusCode == 404){
     throw const EmptyException(message: 'Data not found Error 404');
   }else{
     throw GeneralException(message: 'Cannot Get Data ${response.data}');
   }
  }

  @override
  Future<UserModel> getUser() async {
    final response = await dio.getRequest(endpoint: ApiEndPoint.baseUrlDetailUser,isAuthorize: true,);
    if(response.statusCode== 200){
      Map<String,dynamic> dataBody = response.data;
      Map<String,dynamic> data = dataBody['user'];
      return UserModel.fromJson(data);
    }if(response.statusCode == 404){
      throw const EmptyException(message: 'Data not found Error 404');
    }else{
      throw GeneralException(message: 'Cannot Get Data ${response.data}');
    }
  }

  @override
  Future<String> logout() async {
    return Future.delayed(Duration(seconds: 2),() async {
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('token');
      return 'Berhasil Log out';
    },);
  }
}
