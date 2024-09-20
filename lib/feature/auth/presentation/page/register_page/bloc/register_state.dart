part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {
final RegisterEntities user;

RegisterSuccess(this.user);

@override
List<Object?> get props => [user];
}
class RegisterFailure extends RegisterState {
final String error;

RegisterFailure(this.error);

@override
List<Object?> get props => [error];
}
