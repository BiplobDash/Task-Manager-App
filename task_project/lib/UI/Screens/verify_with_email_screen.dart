import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task_project/UI/Screens/otp_verification_screen.dart';
import 'package:task_project/UI/utils/text_style.dart';
import 'package:task_project/UI/widgets/appElevatedButton.dart';
import 'package:task_project/UI/widgets/app_text_feild_widget.dart';
import 'package:task_project/UI/widgets/screenBackground.dart';

import '../widgets/appTextButton.dart';

class VerifyWithEmailScreen extends StatefulWidget {
  const VerifyWithEmailScreen({super.key});

  @override
  State<VerifyWithEmailScreen> createState() => _VerifyWithEmailScreenState();
}

class _VerifyWithEmailScreenState extends State<VerifyWithEmailScreen> {
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
                'Your Email Address',
                style: screenTitleTextStyle,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                  'A 6 digits verification pin will be sent to your email address',
                  style: screenSubTitleTextStyle),
              SizedBox(
                height: 24,
              ),
              AppTextFieldWidget(
                  hintText: 'Email Adress',
                  controller: TextEditingController()),
              SizedBox(
                height: 16,
              ),
              AppElevatedButton(
                  child: Icon(Icons.arrow_circle_right_outlined),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> OtpVerificationScreen()));
                  }),
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
      )),
    );
  }
}
