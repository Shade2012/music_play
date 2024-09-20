import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:music_play_bloc/core/error/failure.dart';
import 'package:music_play_bloc/core/route/my_router.dart';
import 'package:music_play_bloc/feature/profile/domain/entities/user_entities.dart';
import 'package:music_play_bloc/feature/profile/domain/usecases/logout.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final Logout;
  ProfileBloc({required this.Logout}) : super(ProfileInitial()) {
    on<ProfileEventDetailUsers>((event, emit) {
      //emit(ProfileLoading());
      //contoh di kuldi
      //Either<Failure,<User>> hasilGetUser = await getUser.execute();
      //hasilGetUser.fold((left){
      //emit(ProfileError(message: 'Cannot get all user'));
      // },(right){
      // emit(ProfileAllUser(allUsers: right));
      // });
    });
    on<ProfileEventLogOut>((event,emit) async {
      emit(ProfileLoading());
      Either <Failure,String> logout = await Logout.execute();
      logout.fold((leftFailure) {
        emit(ProfileError(message: leftFailure.toString()));
      }, (r) {
        emit(ProfileNavigateToSplashScreen());
      },);
    });
  }
}
