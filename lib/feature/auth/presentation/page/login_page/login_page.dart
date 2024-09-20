import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:music_play_bloc/core/theme/images.dart';
import 'package:music_play_bloc/core/widget/common_button.dart';
import 'package:music_play_bloc/feature/auth/presentation/page/login_page/bloc/login_bloc.dart';
import '../../../../../core/error/snackbar_error.dart';
import '../../../../../core/theme/textstyle.dart';
import '../../../../../core/widget/textformfield_custom.dart';
import 'bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obsecureText = true; // This is to manage the obscureText state

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Function to toggle password visibility
  void togglePasswordVisibility() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<LoginBloc, LoginState>(
          builder: (context, state) {
            return Padding(
              padding:  EdgeInsets.only(left: 20,right:20, top: screenHeight * 0.2),
              child: Column(
                children: [
                  const Text('Music Play', style: txtHeadingAuth),
                  const SizedBox(height: 20),
                  const Text(
                    'Aplikasi setel musik tidak hanya streaming tetapi kamu juga bisa memilih file musik mu sendiri loh',
                    style: txtParagraft,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                      child: Column(
                    children: <Widget>[
                      CustomTextField(
                        Icons.person,
                        TextInputType.emailAddress,
                        'Email',
                        'Your Email',
                        false,
                        _emailController,
                        1,
                            () {}, // No need to toggle anything for the email field
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        Icons.lock,
                        TextInputType.text,
                        'Password',
                        'Your Password',
                        _obsecureText,
                        _passwordController,
                        0,
                        togglePasswordVisibility, // Pass the toggle function to the widget
                      ),
                      const SizedBox(height: 30),
                      CommonButton(
                        text: 'Login',
                        height: screenHeight * 0.06,
                        isLoading: state is LoginLoading,
                        onPressed: () {
                          if (_emailController.text.isEmpty ||
                              _passwordController.text.isEmpty) {
                            SnackBarError.showError(context, 'Please fill all fields');
                            return;
                          }
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(
                              LoginButtonPressed(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                            return;
                          }
                          SnackBarError.showError(context, 'Please make the requirement');
                        },),
                    ],
                  )),
                  const SizedBox(height: 30),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Doesnt have account? ',
                          style: txtParagraft,
                        ),
                        TextSpan(
                          text: 'Register',
                          style: txtLink,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.pushNamed('register_page');
                            },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          listener: (context, state) {
            if (state is LoginSuccess) {
              context.pushNamed('all_user');
            } else if (state is LoginFailure) {
              SnackBarError.showError(context, state.error);
            }
          },
        ),
      ),
      bottomNavigationBar: SizedBox(width: double.infinity,height: screenHeight *0.25,child: Image.asset(Images.backgroundLogin,fit: BoxFit.cover,alignment: Alignment.center,),),
    );
  }
}
