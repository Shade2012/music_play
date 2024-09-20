import 'package:go_router/go_router.dart';
import 'package:music_play_bloc/feature/auth/presentation/page/login_page/login_page.dart';
import 'package:music_play_bloc/feature/auth/presentation/page/register_page/register_page.dart';
import 'package:music_play_bloc/feature/profile/presentation/page/all_users_page_view.dart';
import 'package:music_play_bloc/feature/profile/presentation/page/profile_page_view.dart';
import 'package:music_play_bloc/feature/splashscreen/splashscreen_view.dart';

class MyRouter{
 get router => GoRouter(
   // initialLocation: '/alluser',
   initialLocation: '/splash',
   routes: [
     GoRoute(
       name: 'splash',
       path: '/splash',
       builder: (context, state) => SplashScreen(),
     ),
     GoRoute(
       path: '/alluser',
       name:'all_user',
       pageBuilder: (context, state) => const NoTransitionPage(child: AllUsersPage()),
       //sub route
       routes: [
         GoRoute(
           path: 'detail-user',
           name:'detail_user',
           pageBuilder: (context, state) => NoTransitionPage(child: ProfilePage(userid: state.extra as int,)),
         )
       ]
     ),
     GoRoute(
         path: '/login-page',
         name:'login_page',
         pageBuilder: (context, state) => const NoTransitionPage(child: LoginPage()),
     ),
     GoRoute(
       path: '/register-page',
       name:'register_page',
       pageBuilder: (context, state) => const NoTransitionPage(child: RegisterPage()),
     ),
   ],

 );
}
