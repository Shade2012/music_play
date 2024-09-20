part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ProfileLoading extends ProfileState {
@override
List<Object> get props => [];
}

final class ProfileError extends ProfileState {
  final String message;
  ProfileError({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

final class ProfileAllUser extends ProfileState {
  final List<User> allUsers;
  ProfileAllUser({required this.allUsers});
  @override
  // TODO: implement props
  List<Object?> get props => [allUsers];
}

final class ProfileGetUser extends ProfileState {
  final User getUsers;

  ProfileGetUser({required this.getUsers});
  @override
// TODO: implement props
  List<Object?> get props => [getUsers];
}

class ProfileNavigateToSplashScreen extends ProfileState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ProfileSuccess extends ProfileState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
