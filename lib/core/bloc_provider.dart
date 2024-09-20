import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_play_bloc/feature/auth/data/datasources/remote/auth_remote_data_source_impl.dart';
import 'package:music_play_bloc/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:music_play_bloc/feature/auth/domain/usecases/login.dart';
import 'package:music_play_bloc/feature/auth/domain/usecases/register.dart';
import 'package:music_play_bloc/feature/auth/presentation/page/register_page/bloc/register_bloc.dart';
import 'package:music_play_bloc/feature/profile/data/datasources/remote/user_remote_data_sources_impl.dart';
import 'package:music_play_bloc/feature/profile/domain/usecases/logout.dart';
import 'package:music_play_bloc/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:music_play_bloc/feature/splashscreen/bloc/splashscreen_bloc.dart';
import '../feature/auth/presentation/page/login_page/bloc/login_bloc.dart';
import '../feature/profile/data/repository/user_repository_impl.dart';

class AppProviders {
  final providers = [
    BlocProvider<SplashScreenBloc>(
      create: (context) => SplashScreenBloc(),
    ),
    // RepositoryProvider<AuthRepository>(
    //   create: (context) => AuthRepositoryImpl(
    //     authRemoteDataSource: AuthRemoteDataSourceImpl(),
    //   ),
    // ),

    BlocProvider<LoginBloc>(
      create: (context) {
        // final authRepository = RepositoryProvider.of<AuthRepository>(context);
        final authRepository = AuthRepositoryImpl(
          authRemoteDataSource: AuthRemoteDataSourceImpl(),
        );
        return LoginBloc(Login: Login(authRepository));
      },
    ),
    BlocProvider<ProfileBloc>(
      create: (context) {
        final userRepository = UserRepositoryImpl(
          userRemoteDataSources: UserRemoteDataSourcesImpl(),
        );
        return ProfileBloc(Logout: Logout(userRepository));
      },
    ),

    BlocProvider<RegisterBloc>(
      create: (context) {
        final authRepository = AuthRepositoryImpl(
          authRemoteDataSource: AuthRemoteDataSourceImpl(),
        );
        return RegisterBloc(Register: Register(authRepository));
      },
    ),
  ];
}
