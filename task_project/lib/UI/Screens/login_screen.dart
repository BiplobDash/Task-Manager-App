import 'package:flutter/material.dart';
import 'package:task_project/UI/Screens/main_bottom_nav.dart';
import 'package:task_project/UI/Screens/signUp_screen.dart';
import 'package:task_project/UI/Screens/verify_with_email_screen.dart';
import 'package:task_project/UI/utils/snickbar_message.dart';
import 'package:task_project/UI/widgets/appTextButton.dart';
import 'package:task_project/UI/widgets/screenBackground.dart';
import 'package:task_project/data/auth_utils.dart';
import 'package:task_project/data/network_utils.dart';
import 'package:task_project/data/urls.dart';

import '../utils/text_style.dart';
import '../widgets/appElevatedButton.dart';
import '../widgets/app_text_feild_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _inProgress = false;

  Future<void> login() async {
    setState(() {
      _inProgress = true;
    });
    final result = await NetworkUtils().postMethod(Urls.loginUrl, body: {
      'email': _emailController.text.trim(),
      'password': _passController.text,
    }, onUnAuthorize: () {
      showSnackBarMessage(context, 'Username or Password Incorrect', true);
    });
    setState(() {
      _inProgress = false;
    });
    if (result != null && result['status'] == 'success') {
      await AuthUtils.saveUserData(
          result['data']['firstName'], result['data']['lastName'], result['token'], result['data']['photo'], result['data']['mobile'],result['data']['email']);

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => MainBottomNavBar()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 90,
                    ),
                    Text(
                      'Get Started with',
                      style: screenTitleTextStyle,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    AppTextFieldWidget(
                      controller: _emailController,
                      hintText: 'Email',
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Enter your valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    AppTextFieldWidget(
                      obscureText: true,
                      hintText: 'Password',
                      controller: _passController,
                      validator: (value) {
                        if ((value?.isEmpty ?? true) &&
                            ((value!.length) <= 6)) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    if (_inProgress)
                      Center(
                        child: CircularProgressIndicator(color: Colors.green),
                      )
                    else
                      AppElevatedButton(
                        child: Icon(Icons.arrow_circle_right),
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            login();
                          }
                        },
                      ),
                    SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => VerifyWithEmailScreen()));
                        },
                        child: Text('Forgot Password',
                            style: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    AppTextButtonStyle(
                        text: 'Don\'t have an account',
                        buttonText: 'Sign-Up',
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => SignUp()));
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
