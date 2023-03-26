import 'package:flutter/material.dart';
import 'package:task_project/UI/Screens/signUp_screen.dart';
import 'package:task_project/UI/Screens/verify_with_email_screen.dart';
import 'package:task_project/UI/widgets/appTextButton.dart';
import 'package:task_project/UI/widgets/screenBackground.dart';

import '../utils/text_style.dart';
import '../widgets/appElevatedButton.dart';
import '../widgets/app_text_feild_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Get Started with',
                style: screenTitleTextStyle,
              ),
              SizedBox(
                height: 24,
              ),
              AppTextFieldWidget(
                controller: TextEditingController(),
                hintText: 'Email',
              ),
              SizedBox(
                height: 16,
              ),
              AppTextFieldWidget(
                  obscureText: true,
                  hintText: 'Password',
                  controller: TextEditingController()),
              SizedBox(
                height: 16,
              ),
              AppElevatedButton(
                child: Icon(Icons.arrow_circle_right),
                onTap: () {},
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> VerifyWithEmailScreen()));
                  },
                  child: Text('Forgot Password',
                      style: TextStyle(color: Colors.grey)),
                ),
              ),
              AppTextButtonStyle(
                  text: 'Don\'t have an account',
                  buttonText: 'Sign-Up',
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => SignUp()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
