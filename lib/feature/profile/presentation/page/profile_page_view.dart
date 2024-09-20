import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:music_play_bloc/feature/profile/presentation/bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  final int userid;
  const ProfilePage({Key? key, required this.userid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users $userid'), centerTitle: true),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProfileBloc>().add(ProfileEventLogOut());
                    },
                    child: Text('Log out'),
                  ),
                  Container(height: 100, width: double.infinity, color: Colors.black),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      child: Column(
                        children: [
                          Text('Name'),
                          Text('Username'),
                          Text('Email'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is ProfileNavigateToSplashScreen) {
            context.pushNamed('splash');
          } else if (state is ProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
      ),
    );
  }
}

