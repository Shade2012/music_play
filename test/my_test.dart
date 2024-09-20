import 'package:music_play_bloc/feature/profile/data/datasources/remote/user_remote_data_sources_impl.dart';
import 'package:flutter/widgets.dart';  // Ensure this import for WidgetsFlutterBinding

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Ensure that Flutter bindings are initialized

  final UserRemoteDataSourcesImpl userRemoteDataSourcesImpl = UserRemoteDataSourcesImpl();
  final response = await userRemoteDataSourcesImpl.getAllUser();  // Await the asynchronous call
  print(response);
}
