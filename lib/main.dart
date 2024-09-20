import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_play_bloc/core/bloc_provider.dart';
import 'package:music_play_bloc/core/route/my_router.dart';
import 'package:music_play_bloc/feature/auth/data/datasources/remote/auth_remote_data_source_impl.dart';
import 'package:music_play_bloc/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:music_play_bloc/feature/auth/domain/repositories/auth_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppProviders().providers,
      child: MaterialApp.router(
        routerConfig: MyRouter().router,
      ),
    );
  }
}
