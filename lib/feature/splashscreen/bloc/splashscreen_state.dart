part of 'splashscreen_bloc.dart';

abstract class SplashScreenState extends Equatable {
  @override
  List<Object> get props => [];
}

final class SplashScreenInitial extends SplashScreenState {}

class SplashNavigateToLogin extends SplashScreenState {}

class SplashNavigateToProfile extends SplashScreenState {}
