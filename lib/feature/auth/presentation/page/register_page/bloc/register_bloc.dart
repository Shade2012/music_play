import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:music_play_bloc/core/error/failure.dart';
import 'package:music_play_bloc/feature/auth/domain/entities/register_entities.dart';
import 'package:music_play_bloc/feature/auth/domain/usecases/register.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final Register;
  RegisterBloc({required this.Register}) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<OnRegisterButtonPressed>((event, emit) async {
      emit(RegisterLoading());
      Either<Failure,RegisterEntities> result = await Register.execute(event.name,event.email,event.password);
      result.fold((failure) {
        emit(RegisterFailure(failure.message));
      }, (success) {
        emit(RegisterSuccess(success));
      },);
    },);
  }
}
