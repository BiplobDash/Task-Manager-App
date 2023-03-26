import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task_project/UI/utils/text_style.dart';
import 'package:task_project/UI/widgets/appElevatedButton.dart';
import 'package:task_project/UI/widgets/appTextButton.dart';
import 'package:task_project/UI/widgets/app_text_feild_widget.dart';
import 'package:task_project/UI/widgets/screenBackground.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackground(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                Text(
                  'Join with us.',
                  style: screenTitleTextStyle,
                ),
                SizedBox(
                  height: 24,
                ),
                AppTextFieldWidget(
                    hintText: 'Email', controller: TextEditingController()),
                SizedBox(
                  height: 8,
                ),
                AppTextFieldWidget(
                    hintText: 'First Name',
                    controller: TextEditingController()),
                SizedBox(
                  height: 8,
                ),
                AppTextFieldWidget(
                    hintText: 'Last Name', controller: TextEditingController()),
                SizedBox(
                  height: 8,
                ),
                AppTextFieldWidget(
                    hintText: 'Password', controller: TextEditingController()),
                SizedBox(
                  height: 8,
                ),
                AppElevatedButton(
                    child: Icon(Icons.arrow_circle_right_outlined),
                    onTap: () {}),
                SizedBox(
                  height: 16,
                ),
                AppTextButtonStyle(
                    text: 'Have account?',
                    buttonText: 'Sign-In',
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
