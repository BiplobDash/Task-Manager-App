import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:task_project/UI/utils/snickbar_message.dart';
import 'package:task_project/UI/utils/text_style.dart';
import 'package:task_project/UI/widgets/appElevatedButton.dart';
import 'package:task_project/UI/widgets/appTextButton.dart';
import 'package:task_project/UI/widgets/app_text_feild_widget.dart';
import 'package:task_project/UI/widgets/screenBackground.dart';
import 'package:task_project/data/network_utils.dart';
import 'package:task_project/data/urls.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackground(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
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
                    hintText: 'Email',
                    controller: emailController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  AppTextFieldWidget(
                    hintText: 'First Name',
                    controller: firstNameController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  AppTextFieldWidget(
                    hintText: 'Last Name',
                    controller: lastNameController,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Enter your last name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  AppTextFieldWidget(
                    hintText: 'Password',
                    controller: passwordController,
                    validator: (value) {
                      if ((value?.isEmpty ?? true) && ((value!.length) <= 6)) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  if (_inProgress)
                    Center(
                      child: CircularProgressIndicator(color: Colors.green),
                    )
                  else
                    AppElevatedButton(
                        child: Icon(Icons.arrow_circle_right_outlined),
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            _inProgress = true;
                            setState(() {
                              
                            });
                            final result = await NetworkUtils()
                                .postMethod(Urls.registrationUrl, body: {
                              'email': emailController.text.trim(),
                              'mobile': mobileController.text.trim(),
                              'password': passwordController.text,
                              'firstName': firstNameController.text.trim(),
                              'lastName': lastNameController.text.trim(),
                            });
                              _inProgress = false;
                            setState(() {
                            });
                            if ((result != null) &&
                                (result['status'] == ['success'])) {
                              firstNameController.clear();
                              lastNameController.clear();
                              passwordController.clear();
                              emailController.clear();
                              mobileController.clear();
                              showSnackBarMessage(
                                  context, 'Resgistration successful!');
                            } else {
                              showSnackBarMessage(context,
                                  'Resgistration failed try again!', true);
                            }
                          }
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
          ),
        ),
      ),
    ));
  }
}
