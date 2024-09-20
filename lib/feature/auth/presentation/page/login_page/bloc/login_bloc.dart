import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:music_play_bloc/feature/auth/domain/entities/login_entities.dart';
import 'package:music_play_bloc/feature/auth/domain/repositories/auth_repository.dart';
import 'package:music_play_bloc/feature/auth/domain/usecases/login.dart';
import '../../../../../../core/error/failure.dart';
import 'login_state.dart';
part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // final AuthRepository authRepository;
  final Login;
  LoginBloc({required this.Login}) : super(LoginInitial())  {
    // LoginBloc({required this.authRepository}) : super(LoginInitial())  {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      Either<Failure,LoginEntities> result = await Login.execute(event.email,event.password);
      result.fold((failure) {
        print("Login failed: ${failure.message}");
        emit(LoginFailure('Failed to login'));
      }, (user){
        print("Login succeeded: ${user.success}");
        emit(LoginSuccess(user)
        );});
    });
  }
}
