part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnRegisterEvent extends RegisterEvent{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class OnRegisterButtonPressed extends RegisterEvent{
  final String name;
  final String email;
  final String password;
  OnRegisterButtonPressed({required this.name,required this.email, required this.password});
  @override
  List<Object?> get props => [name,email, password];
}
