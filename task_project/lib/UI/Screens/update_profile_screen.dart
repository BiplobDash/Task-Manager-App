
import 'package:flutter/material.dart';
import '../utils/text_style.dart';
import '../widgets/appElevatedButton.dart';
import '../widgets/app_text_feild_widget.dart';
import '../widgets/screenBackground.dart';
import '../widgets/user_profile_widget.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          UserProfileWidget(),
          Expanded(
              child: ScreenBackground(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    Text('Update Profile',style: screenTitleTextStyle,),
                    SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: (){},
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                              color: Colors.grey
                            ),
                            child: Text('Photo'),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                                color: Colors.white
                              ),
                              child: Text(''),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8,),
                    AppTextFieldWidget(
                        hintText: 'Email', controller: TextEditingController()),
                    SizedBox(
                      height: 8,
                    ),
                    AppTextFieldWidget(
                        hintText: 'First Name', controller: TextEditingController()),
                    SizedBox(
                      height: 8,
                    ),
                    AppTextFieldWidget(
                        hintText: 'Last Name', controller: TextEditingController()),
                    SizedBox(height: 8,),
                    AppTextFieldWidget(
                        hintText: 'Phone Number', controller: TextEditingController()),
                    SizedBox(height: 8,),
                    AppTextFieldWidget(
                        hintText: 'Password',
                        obscureText: true,
                         controller: TextEditingController()),
                    AppElevatedButton(child: Icon(Icons.arrow_circle_right_outlined), onTap: (){}),
                  ],
                ),
              ),
            ),
          ))
        ],
      )),
    );
  ;
  }
}