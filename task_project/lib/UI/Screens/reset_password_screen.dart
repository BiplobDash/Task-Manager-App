import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task_project/UI/Screens/login_screen.dart';
import 'package:task_project/UI/widgets/app_text_feild_widget.dart';

import '../utils/text_style.dart';
import '../widgets/appElevatedButton.dart';
import '../widgets/appTextButton.dart';
import '../widgets/screenBackground.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Set Password',
                style: screenTitleTextStyle,
              ),
              SizedBox(
                height: 8,
              ),
              Text('Minimum length 0f password must be 6 with letters and number', style: screenSubTitleTextStyle),
              SizedBox(
                height: 24,
              ),
              AppTextFieldWidget(
                obscureText: true,
                  hintText: 'Password', controller: TextEditingController()),
              SizedBox(
                height: 8,
              ),
              AppTextFieldWidget(
                obscureText: true,
                  hintText: 'Confirm Password',
                  controller: TextEditingController()),
              SizedBox(
                height: 8,
              ),
              AppElevatedButton(
                  child: Text('Confirm Password'),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                        (route) => false);
                  }),
              SizedBox(
                height: 16,
              ),
              
              AppTextButtonStyle(
                  text: 'Have account?',
                  buttonText: 'Sign-In',
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                        (route) => false);
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
