import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_play_bloc/core/route/my_router.dart';
import 'package:music_play_bloc/feature/profile/presentation/page/profile_page_view.dart';

class AllUsersPage extends StatelessWidget {
  const AllUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Users'),centerTitle: true,),
      body: SizedBox(
        height: 800,
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: (){
                  context.pushNamed('detail_user', extra: index + 1 );
                },
                title: Text('User ${index +1}'),
              );
            },
        ),
      ),
    );
  }
}
